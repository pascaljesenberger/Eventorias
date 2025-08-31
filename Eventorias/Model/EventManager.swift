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
    private let db = Firestore.firestore()
    
    func fetchEvents() {
        db.collection("Events").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching events: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            self.events = documents.compactMap { document in
                try? document.data(as: Event.self)
            }
        }
    }
}
