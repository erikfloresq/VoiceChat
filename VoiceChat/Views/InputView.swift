//
//  InputView.swift
//  VoiceChat
//
//  Created by Erik Flores on 28/07/25.
//

import SwiftUI
import OSLog
internal import Speech

let logger = Logger(subsystem: "voiceChat", category: "inputView")

struct InputView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @Binding var inputText: String
    @Binding var isUserTalk: Bool

    var body: some View {
        HStack {
            Spacer()
            Button(action: toggleRecording) {
                Image(systemName: "mic.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.white)
                    .padding(30)
                    .background(isRecording ? Color.red : Color.blue)
                    .cornerRadius(100)
                    .scaleEffect(isRecording ? 1.2 : 1.0)
                    .animation(.spring(), value: isRecording)
            }
            Spacer()
        }
        .onAppear(perform: requestPermissions)
        .onChange(of: speechRecognizer.transcript) { newValue in
            inputText = newValue
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func toggleRecording() {
        isRecording.toggle()
        if isRecording {
            do {
                try speechRecognizer.startTranscribing()
                isUserTalk = true
            } catch {
                isRecording = false
                alertMessage = "The speech recognizer could not start"
                showingAlert = true

                logger.error("\(error.localizedDescription)")
            }
        } else {
            speechRecognizer.stopTranscribing()
            isRecording = false
            isUserTalk = false
        }
    }
    
    private func requestPermissions() {
        speechRecognizer.requestAuthorization { authorized, status in
            if !authorized {
                alertMessage = "Enable speech recognition access in your device settings"
                showingAlert = true

                logger.error("Authorization status \(status.rawValue)")
            }
        }
    }
}
