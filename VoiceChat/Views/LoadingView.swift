//
//  LoadingView.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import SwiftUI

struct LoadingView: View {
    let messageType: MessageType

    var body: some View {
        HStack(spacing: 5) {
            if messageType == .sent {
                Spacer()
            }
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(.gray)
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(.gray)
            Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(.gray)
            if messageType == .received {
                Spacer()
            }

        }

    }
}

#Preview {
    LoadingView(messageType: .received)
}
