//
//  EventManagerTests.swift
//  EventoriasTests
//
//  Created by Pascal Jesenberger on 18/09/2025.
//

import XCTest
@testable import Eventorias

@MainActor
final class EventManagerTests: XCTestCase {
    var eventManager: EventManager!
    
    override func setUp() {
        super.setUp()
        eventManager = EventManager()
    }
    
    override func tearDown() {
        eventManager = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(eventManager.events.count, 0)
        XCTAssertFalse(eventManager.isLoading)
        XCTAssertNil(eventManager.error)
    }
    
    func testFetchEventsUpdatesProperties() async {
        XCTAssertFalse(eventManager.isLoading)
        XCTAssertNil(eventManager.error)
        
        await eventManager.fetchEvents()
        
        XCTAssertFalse(eventManager.isLoading)
        XCTAssertNil(eventManager.error)
        XCTAssertNotNil(eventManager.events)
    }
    
    func testFetchEventsResetsError() async {
        eventManager.error = NSError(domain: "TestError", code: 1)
        
        await eventManager.fetchEvents()
        
        XCTAssertNil(eventManager.error)
    }
}
