//
//  Copyright (c) 2022 Open Whisper Systems. All rights reserved.
//

import Foundation

extension OutgoingStoryMessage {
    override class func prepareForMultisending(
        destinations: [MultisendDestination],
        state: MultisendState,
        transaction: SDSAnyWriteTransaction
    ) throws {
        var privateStoryMessageIds: [UUID: String] = [:]

        for destination in destinations {
            switch destination.content {
            case .media(let attachments):
                for identifiedAttachment in attachments {
                    let attachment = identifiedAttachment.value
                    attachment.captionText = state.approvalMessageBody?.plaintextBody(transaction: transaction.unwrapGrdbRead)
                    let attachmentStream = try attachment
                        .buildOutgoingAttachmentInfo()
                        .asStreamConsumingDataSource(withIsVoiceMessage: attachment.isVoiceMessage)
                    attachmentStream.anyInsert(transaction: transaction)

                    var correspondingIdsForAttachment = state.correspondingAttachmentIds[identifiedAttachment.id] ?? []
                    correspondingIdsForAttachment += [attachmentStream.uniqueId]
                    state.correspondingAttachmentIds[identifiedAttachment.id] = correspondingIdsForAttachment

                    let message: OutgoingStoryMessage
                    if destination.thread is TSPrivateStoryThread, let privateStoryMessageId = privateStoryMessageIds[identifiedAttachment.id] {
                        message = try OutgoingStoryMessage.createUnsentMessage(
                            thread: destination.thread,
                            storyMessageId: privateStoryMessageId,
                            transaction: transaction
                        )
                    } else {
                        message = try OutgoingStoryMessage.createUnsentMessage(
                            attachment: .file(attachmentId: attachmentStream.uniqueId),
                            thread: destination.thread,
                            transaction: transaction
                        )
                        if destination.thread is TSPrivateStoryThread {
                            privateStoryMessageIds[identifiedAttachment.id] = message.storyMessageId
                        }
                    }

                    state.messages.append(message)
                    state.unsavedMessages.append(message)
                }

            case .text(let textAttachment):
                let message = try OutgoingStoryMessage.createUnsentMessage(
                    attachment: .text(attachment: textAttachment),
                    thread: destination.thread,
                    transaction: transaction
                )

                state.messages.append(message)
                state.unsavedMessages.append(message)
            }
        }

        OutgoingStoryMessage.dedupePrivateStoryRecipients(for: state.messages.lazy.compactMap { $0 as? OutgoingStoryMessage }, transaction: transaction)
    }
}
