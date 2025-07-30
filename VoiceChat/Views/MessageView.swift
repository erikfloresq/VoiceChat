//
//  MessageView.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import SwiftUI

struct MessageView: View {
    let text: String
    let messageType: MessageType

    var body: some View {
        HStack {
            if messageType == .sent {
                Spacer()
            }
            Text(text)
                .padding()
                .foregroundColor(.white)
                .background(messageType == .sent ? Color.gray : Color.red)
                .cornerRadius(20)
            if messageType == .received {
                Spacer()
            }
        }
    }
}

#Preview("Sent message") {
    MessageView(text: "Demo", messageType: .sent)
    MessageView(text: "Demo asdasd", messageType: .sent)
}

#Preview("Recived message") {
    MessageView(text: "Demo", messageType: .received)
}
