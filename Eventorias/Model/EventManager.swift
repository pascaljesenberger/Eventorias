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
    
    func fetchEvents() {
        isLoading = true
        error = nil
        
        db.collection("Events").getDocuments { snapshot, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print("Error fetching events: \(error)")
                    self.error = error
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    self.error = NSError(domain: "EventManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "No documents found"])
                    return
                }
                
                self.events = documents.compactMap { document in
                    try? document.data(as: Event.self)
                }
                self.error = nil
            }
        }
    }
}
