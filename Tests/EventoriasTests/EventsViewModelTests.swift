//
//  EventsViewModelTests.swift
//  EventoriasTests
//
//  Created by Pascal Jesenberger on 15/09/2025.
//

import XCTest
@testable import Eventorias

struct MockEvent {
    let title: String
    let description: String
    let date: String
}

class EventsViewModelTests: XCTestCase {
    var viewModel: EventsViewModel!
    
    override func setUp() {
        viewModel = EventsViewModel()
    }
    
    func testSearchFiltering() {
        let events = [
            MockEvent(title: "Concert Jazz", description: "Musique", date: "2025-12-01"),
            MockEvent(title: "Festival Rock", description: "Concert", date: "2025-12-02")
        ]
        
        viewModel.allEvents = events
        viewModel.searchText = "Jazz"
        viewModel.filterAndSort()
        
        XCTAssertEqual(viewModel.filteredEvents.count, 1)
        XCTAssertEqual(viewModel.filteredEvents.first?.title, "Concert Jazz")
    }
    
    func testDateSorting() {
        let events = [
            MockEvent(title: "Event B", description: "", date: "2025-12-02"),
            MockEvent(title: "Event A", description: "", date: "2025-12-01")
        ]
        
        viewModel.allEvents = events
        viewModel.selectedSortOption = .dateAsc
        viewModel.filterAndSort()
        
        XCTAssertEqual(viewModel.filteredEvents.first?.title, "Event A")
    }
}
