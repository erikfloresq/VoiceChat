//
//  Untitled.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import SwiftUI

struct VoiceChatView: View {
    let agentService = AgentService()
    @State private var messageInput: String = ""
    @State private var messages: [Message] = []
    @State private var editingMessageID: UUID? = nil
    @State var isLoading: Bool = false
    @State var isUserTalk: Bool = false

    var body: some View {
        VStack {
            ChatView(messages: messages, isLoading: $isLoading)
            InputView(inputText: $messageInput, isUserTalk: $isUserTalk)
        }
        .padding()
        .onChange(of: messageInput) { oldValue, newValue in
            if newValue.isEmpty {
                editingMessageID = nil
            } else if let id = editingMessageID, let idx = messages.firstIndex(where: { $0.id == id }) {
                messages[idx].text = newValue
            } else {
                let newMsg = Message(id: UUID(), type: .sent, text: newValue)
                messages.append(newMsg)
                editingMessageID = newMsg.id
            }
        }
        .onChange(of: isUserTalk) { oldValue, newValue in
            if !newValue {
                Task {
                    isLoading = true
                    let response = try await agentService.getAgentResponse()
                    isLoading = false
                    let newMsg = Message(id: UUID(), type: .received, text: response)
                    messages.append(newMsg)
                }
            }
        }
    }
}

#Preview {
    VoiceChatView(
        isLoading: false
    )
}
