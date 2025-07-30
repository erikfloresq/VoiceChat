//
//  AgentService.swift
//  VoiceChat
//
//  Created by Erik Flores on 29/07/25.
//

struct AgentService {
    func getAgentResponse() async throws -> String {
        try await Task.sleep(for: .seconds(1))
        return "Respuesta desde IA"
    }
}
