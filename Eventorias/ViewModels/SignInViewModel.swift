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
        signIn()
    }

    func signIn() {
        isLoading = true
        errorMessage = nil

        let emailTrimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = password.trimmingCharacters(in: .whitespacesAndNewlines)

        Auth.auth().signIn(withEmail: emailTrimmed, password: passwordTrimmed) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let error = error as NSError? {
                    if error.code == AuthErrorCode.userNotFound.rawValue || error.code == 17004 {
                        self?.showSignupConfirmation = true
                    } else {
                        self?.handleAuthError(error)
                    }
                } else {
                    self?.authManager.isSignedIn = true
                }
            }
        }
    }

    func signUp() {
        isLoading = true
        errorMessage = nil

        let emailTrimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordTrimmed = password.trimmingCharacters(in: .whitespacesAndNewlines)

        Auth.auth().createUser(withEmail: emailTrimmed, password: passwordTrimmed) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.showSignupConfirmation = false

                if let error = error as NSError? {
                    self?.handleAuthError(error)
                } else {
                    self?.authManager.isSignedIn = true
                }
            }
        }
    }

    private func handleAuthError(_ error: NSError) {
        switch error.code {
        case AuthErrorCode.invalidEmail.rawValue:
            errorMessage = "Invalid email address"
        case AuthErrorCode.wrongPassword.rawValue:
            errorMessage = "Incorrect password"
        case AuthErrorCode.userNotFound.rawValue:
            errorMessage = "No account found with this email"
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            errorMessage = "An account already exists with this email"
        case AuthErrorCode.weakPassword.rawValue:
            errorMessage = "Password is too weak"
        case AuthErrorCode.networkError.rawValue:
            errorMessage = "Network error. Please check your connection"
        case AuthErrorCode.tooManyRequests.rawValue:
            errorMessage = "Too many requests. Please try again later"
        default:
            errorMessage = "Authentication failed. Please try again"
        }
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
