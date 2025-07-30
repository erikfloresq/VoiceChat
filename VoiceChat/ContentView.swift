//
//  ContentView.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showChatView: Bool = false

    var body: some View {
        VoiceChatView()
    }
}

#Preview {
    ContentView()
}
