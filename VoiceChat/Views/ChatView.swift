//
//  ChatView.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import SwiftUI

struct ChatView: View {
    let messages: [Message]
    @Binding var isLoading: Bool

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(messages) { message in
                        MessageView(text: message.text, messageType: message.type)
                    }
                }
                if isLoading {
                    LoadingView(messageType: .received)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ChatView(messages: [], isLoading: .constant(false))
}
