//
//  AuthenticationViewModelTests.swift
//  EventoriasTests
//
//  Created by Pascal Jesenberger on 15/09/2025.
//

import XCTest
@testable import Eventorias

class MockAuthManager: AuthManager {
    override init() {
        super.init()
    }
}

class AuthenticationViewModelTests: XCTestCase {
    var viewModel: AuthenticationViewModel!
    var mockAuthManager: MockAuthManager!
    
    override func setUp() {
        mockAuthManager = MockAuthManager()
        viewModel = AuthenticationViewModel(authManager: mockAuthManager)
    }
    
    func testEmailValidation() {
        viewModel.email = "invalid-email"
        XCTAssertFalse(viewModel.isEmailValid)
        
        viewModel.email = "valid@email.com"
        XCTAssertTrue(viewModel.isEmailValid)
    }
    
    func testPasswordValidation() {
        viewModel.password = "weak"
        XCTAssertFalse(viewModel.isPasswordValid)
        
        viewModel.password = "StrongPass123"
        XCTAssertTrue(viewModel.isPasswordValid)
    }
    
    func testCanSubmit() {
        viewModel.email = "test@test.com"
        viewModel.password = "ValidPass123"
        XCTAssertTrue(viewModel.canSubmit)
        
        viewModel.isLoading = true
        XCTAssertFalse(viewModel.canSubmit)
    }
}
