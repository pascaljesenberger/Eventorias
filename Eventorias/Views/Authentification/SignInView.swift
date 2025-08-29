//
//  SignInView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel: SignInViewModel
    @FocusState private var focusedField: Field?

    enum Field {
        case email, password
    }

    init(authManager: AuthManager) {
        _viewModel = StateObject(wrappedValue: SignInViewModel(authManager: authManager))
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Sign In")
                    .font(.system(size: 48, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 64)

                VStack(spacing: 24) {
                    CustomTextField(
                        title: "Email",
                        placeholder: "Enter your email",
                        text: $viewModel.email
                    )
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .password }

                    CustomTextField(
                        title: "Password",
                        placeholder: "Enter your password",
                        text: $viewModel.password
                    )
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit { viewModel.submit() }

                    CustomButton(
                        action: { viewModel.submit() },
                        title: viewModel.isLoading ? "Processing..." : "Sign In",
                        width: 242
                    )
                    .disabled(!viewModel.canSubmit)
                    .opacity(viewModel.canSubmit ? 1.0 : 0.5)

                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.appRed)
                            .multilineTextAlignment(.center)
                    }
                }

                Spacer()
            }
        }
        .padding(.horizontal)
        .appBackground
    }
}

#Preview {
    SignInView(authManager: AuthManager())
}
