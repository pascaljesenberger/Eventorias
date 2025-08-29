//
//  SignInViewModel.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 29/08/2025.
//

import Foundation
import FirebaseAuth
import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var email = "" {
        didSet { validate(.email) }
    }
    @Published var password = "" {
        didSet { validate(.password) }
    }
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showSignupConfirmation = false
    @Published var isEmailValid = true
    @Published var isPasswordValid = true

    var authManager: AuthManager

    init(authManager: AuthManager) {
        self.authManager = authManager
    }

    enum Field {
        case email, password
    }

    private func validate(_ field: Field) {
        switch field {
        case .email:
            isEmailValid = isValidEmail(email)
        case .password:
            isPasswordValid = isValidPassword(password)
        }
        updateErrorMessage()
    }

    private func updateErrorMessage() {
        if !isEmailValid {
            errorMessage = "Invalid email format"
        } else if !isPasswordValid {
            errorMessage = "Password must be at least 8 characters, with uppercase, lowercase, and a number"
        } else {
            errorMessage = nil
        }
    }

    var canSubmit: Bool {
        isEmailValid && isPasswordValid && !password.isEmpty && !isLoading
    }

    func submit() {
        guard canSubmit else { return }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: password)
    }
}
