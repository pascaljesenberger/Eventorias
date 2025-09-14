//
//  EventCreationViewModelTests.swift
//  EventoriasTests
//
//  Created by Pascal Jesenberger on 15/09/2025.
//

import XCTest
@testable import Eventorias

class EventCreationViewModelTests: XCTestCase {
    var viewModel: EventCreationViewModel!
    
    override func setUp() {
        viewModel = EventCreationViewModel()
    }
    
    func testDateValidation() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        viewModel.eventDate = formatter.string(from: yesterday)
        XCTAssertFalse(viewModel.isDateValid())
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        viewModel.eventDate = formatter.string(from: tomorrow)
        XCTAssertTrue(viewModel.isDateValid())
    }
    
    func testTimeValidation() {
        viewModel.eventTime = "25:00"
        XCTAssertFalse(viewModel.isTimeValid())
        
        viewModel.eventTime = "14 : 30"
        XCTAssertTrue(viewModel.isTimeValid())
    }
    
    func testCanSubmit() {
        viewModel.eventName = "Test Event"
        viewModel.eventDescription = "Description"
        viewModel.eventAddress = "123 Main St"
        viewModel.eventImage = UIImage()
        viewModel.eventDate = "12/31/2025"
        viewModel.eventTime = "14 : 30"
        
        XCTAssertTrue(viewModel.canSubmit)
        
        viewModel.eventName = ""
        XCTAssertFalse(viewModel.canSubmit)
    }
}
