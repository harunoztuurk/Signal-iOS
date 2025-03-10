//
//  Copyright (c) 2022 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDB
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Typed Convenience Methods

@objc
public extension OWSAddToContactsOfferMessage {
    // NOTE: This method will fail if the object has unexpected type.
    class func anyFetchAddToContactsOfferMessage(
        uniqueId: String,
        transaction: SDSAnyReadTransaction
    ) -> OWSAddToContactsOfferMessage? {
        assert(uniqueId.count > 0)

        guard let object = anyFetch(uniqueId: uniqueId,
                                    transaction: transaction) else {
                                        return nil
        }
        guard let instance = object as? OWSAddToContactsOfferMessage else {
            owsFailDebug("Object has unexpected type: \(type(of: object))")
            return nil
        }
        return instance
    }

    // NOTE: This method will fail if the object has unexpected type.
    func anyUpdateAddToContactsOfferMessage(transaction: SDSAnyWriteTransaction, block: (OWSAddToContactsOfferMessage) -> Void) {
        anyUpdate(transaction: transaction) { (object) in
            guard let instance = object as? OWSAddToContactsOfferMessage else {
                owsFailDebug("Object has unexpected type: \(type(of: object))")
                return
            }
            block(instance)
        }
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class OWSAddToContactsOfferMessageSerializer: SDSSerializer {

    private let model: OWSAddToContactsOfferMessage
    public required init(model: OWSAddToContactsOfferMessage) {
        self.model = model
    }

    // MARK: - Record

    func asRecord() throws -> SDSRecord {
        let id: Int64? = model.sortId > 0 ? Int64(model.sortId) : model.grdbId?.int64Value

        let recordType: SDSRecordType = .addToContactsOfferMessage
        let uniqueId: String = model.uniqueId

        // Properties
        let receivedAtTimestamp: UInt64 = model.receivedAtTimestamp
        let timestamp: UInt64 = model.timestamp
        let threadUniqueId: String = model.uniqueThreadId
        let attachmentIds: Data? = optionalArchive(model.attachmentIds)
        let authorId: String? = nil
        let authorPhoneNumber: String? = nil
        let authorUUID: String? = nil
        let body: String? = model.body
        let callType: RPRecentCallType? = nil
        let configurationDurationSeconds: UInt32? = nil
        let configurationIsEnabled: Bool? = nil
        let contactShare: Data? = optionalArchive(model.contactShare)
        let createdByRemoteName: String? = nil
        let createdInExistingGroup: Bool? = nil
        let customMessage: String? = model.customMessage
        let envelopeData: Data? = nil
        let errorType: TSErrorMessageType? = nil
        let expireStartedAt: UInt64? = model.expireStartedAt
        let expiresAt: UInt64? = model.expiresAt
        let expiresInSeconds: UInt32? = model.expiresInSeconds
        let groupMetaMessage: TSGroupMetaMessage? = nil
        let hasLegacyMessageState: Bool? = nil
        let hasSyncedTranscript: Bool? = nil
        let isFromLinkedDevice: Bool? = nil
        let isLocalChange: Bool? = nil
        let isViewOnceComplete: Bool? = model.isViewOnceComplete
        let isViewOnceMessage: Bool? = model.isViewOnceMessage
        let isVoiceMessage: Bool? = nil
        let legacyMessageState: TSOutgoingMessageState? = nil
        let legacyWasDelivered: Bool? = nil
        let linkPreview: Data? = optionalArchive(model.linkPreview)
        let messageId: String? = nil
        let messageSticker: Data? = optionalArchive(model.messageSticker)
        let messageType: TSInfoMessageType? = model.messageType
        let mostRecentFailureText: String? = nil
        let preKeyBundle: Data? = nil
        let protocolVersion: UInt? = nil
        let quotedMessage: Data? = optionalArchive(model.quotedMessage)
        let read: Bool? = model.wasRead
        let recipientAddress: Data? = nil
        let recipientAddressStates: Data? = nil
        let sender: Data? = nil
        let serverTimestamp: UInt64? = nil
        let sourceDeviceId: UInt32? = nil
        let storedMessageState: TSOutgoingMessageState? = nil
        let storedShouldStartExpireTimer: Bool? = model.storedShouldStartExpireTimer
        let unregisteredAddress: Data? = optionalArchive(model.unregisteredAddress)
        let verificationState: OWSVerificationState? = nil
        let wasReceivedByUD: Bool? = nil
        let infoMessageUserInfo: Data? = optionalArchive(model.infoMessageUserInfo)
        let wasRemotelyDeleted: Bool? = model.wasRemotelyDeleted
        let bodyRanges: Data? = optionalArchive(model.bodyRanges)
        let offerType: TSRecentCallOfferType? = nil
        let serverDeliveryTimestamp: UInt64? = nil
        let eraId: String? = nil
        let hasEnded: Bool? = nil
        let creatorUuid: String? = nil
        let joinedMemberUuids: Data? = nil
        let wasIdentityVerified: Bool? = nil
        let paymentCancellation: Data? = nil
        let paymentNotification: Data? = nil
        let paymentRequest: Data? = nil
        let viewed: Bool? = nil
        let serverGuid: String? = nil
        let storyAuthorUuidString: String? = model.storyAuthorUuidString
        let storyTimestamp: UInt64? = archiveOptionalNSNumber(model.storyTimestamp, conversion: { $0.uint64Value })
        let isGroupStoryReply: Bool? = model.isGroupStoryReply
        let storyReactionEmoji: String? = model.storyReactionEmoji
        let giftBadge: Data? = optionalArchive(model.giftBadge)

        return InteractionRecord(delegate: model, id: id, recordType: recordType, uniqueId: uniqueId, receivedAtTimestamp: receivedAtTimestamp, timestamp: timestamp, threadUniqueId: threadUniqueId, attachmentIds: attachmentIds, authorId: authorId, authorPhoneNumber: authorPhoneNumber, authorUUID: authorUUID, body: body, callType: callType, configurationDurationSeconds: configurationDurationSeconds, configurationIsEnabled: configurationIsEnabled, contactShare: contactShare, createdByRemoteName: createdByRemoteName, createdInExistingGroup: createdInExistingGroup, customMessage: customMessage, envelopeData: envelopeData, errorType: errorType, expireStartedAt: expireStartedAt, expiresAt: expiresAt, expiresInSeconds: expiresInSeconds, groupMetaMessage: groupMetaMessage, hasLegacyMessageState: hasLegacyMessageState, hasSyncedTranscript: hasSyncedTranscript, isFromLinkedDevice: isFromLinkedDevice, isLocalChange: isLocalChange, isViewOnceComplete: isViewOnceComplete, isViewOnceMessage: isViewOnceMessage, isVoiceMessage: isVoiceMessage, legacyMessageState: legacyMessageState, legacyWasDelivered: legacyWasDelivered, linkPreview: linkPreview, messageId: messageId, messageSticker: messageSticker, messageType: messageType, mostRecentFailureText: mostRecentFailureText, preKeyBundle: preKeyBundle, protocolVersion: protocolVersion, quotedMessage: quotedMessage, read: read, recipientAddress: recipientAddress, recipientAddressStates: recipientAddressStates, sender: sender, serverTimestamp: serverTimestamp, sourceDeviceId: sourceDeviceId, storedMessageState: storedMessageState, storedShouldStartExpireTimer: storedShouldStartExpireTimer, unregisteredAddress: unregisteredAddress, verificationState: verificationState, wasReceivedByUD: wasReceivedByUD, infoMessageUserInfo: infoMessageUserInfo, wasRemotelyDeleted: wasRemotelyDeleted, bodyRanges: bodyRanges, offerType: offerType, serverDeliveryTimestamp: serverDeliveryTimestamp, eraId: eraId, hasEnded: hasEnded, creatorUuid: creatorUuid, joinedMemberUuids: joinedMemberUuids, wasIdentityVerified: wasIdentityVerified, paymentCancellation: paymentCancellation, paymentNotification: paymentNotification, paymentRequest: paymentRequest, viewed: viewed, serverGuid: serverGuid, storyAuthorUuidString: storyAuthorUuidString, storyTimestamp: storyTimestamp, isGroupStoryReply: isGroupStoryReply, storyReactionEmoji: storyReactionEmoji, giftBadge: giftBadge)
    }
}
