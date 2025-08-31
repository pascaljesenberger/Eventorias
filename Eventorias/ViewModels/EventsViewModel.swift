//
//  EventsViewModel.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 31/08/2025.
//

import Foundation
import Combine

enum SortOption: String, CaseIterable {
    case dateAsc = "Date ↑"
    case dateDesc = "Date ↓"
    case titleAsc = "A-Z"
    case titleDesc = "Z-A"
}

@MainActor
class EventsViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedSortOption: SortOption = .dateAsc
    @Published var filteredEvents: [Event] = []
    
    private let eventManager = EventManager()
    private var allEvents: [Event] = []
    
    init() {
        eventManager.$events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] events in
                self?.allEvents = events
                self?.filterAndSort()
            }
            .store(in: &cancellables)
    }
    
    func fetchEvents() {
        eventManager.fetchEvents()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func filterAndSort() {
        var result = allEvents
        
        if !searchText.isEmpty {
            result = result.filter { event in
                event.title.localizedCaseInsensitiveContains(searchText) ||
                event.description.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        switch selectedSortOption {
        case .dateAsc:
            result = result.sorted { $0.date < $1.date }
        case .dateDesc:
            result = result.sorted { $0.date > $1.date }
        case .titleAsc:
            result = result.sorted { $0.title < $1.title }
        case .titleDesc:
            result = result.sorted { $0.title > $1.title }
        }
        
        filteredEvents = result
    }
}
