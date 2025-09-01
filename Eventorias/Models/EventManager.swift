//
//  EventManager.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 31/08/2025.
//

import Foundation
import FirebaseFirestore

class EventManager: ObservableObject {
    @Published var events: [Event] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private let db = Firestore.firestore()
    
    func fetchEvents() async {
        isLoading = true
        error = nil
        do {
            let snapshot = try await db.collection("Events").getDocuments()
            events = snapshot.documents.compactMap { try? $0.data(as: Event.self) }
        } catch {
            self.error = error
        }
        isLoading = false
    }
}
