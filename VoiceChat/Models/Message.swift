//
//  Message.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import Foundation

struct Message: Identifiable {
    let id: UUID
    let type: MessageType
    var text: String
}
