//
//  SignInView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?

    enum Field {
        case email, password
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 32) {
                    Text("Sign In")
                        .font(.system(size: 48, weight: .semibold))
                        .foregroundColor(.white)
                    
                    VStack(spacing: 24) {
                        CustomTextField(
                            title: "Email",
                            placeholder: "Enter your email",
                            text: $email
                        )
                        .focused($focusedField, equals: .email)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .password
                        }
                        
                        CustomTextField(
                            title: "Password",
                            placeholder: "Enter your password",
                            text: $password
                        )
                        .focused($focusedField, equals: .password)
                        .submitLabel(.done)
                        .onSubmit {
                            print("Sign In tapped")
                        }
                    }
                    .padding(.vertical, 34)
                    
                    CustomButton(
                        action: { print("Sign In tapped") },
                        title: "Sign In",
                        width: 242
                    )
                    
                    Spacer()
                }
                .padding(.top, 84)
            }
        }
        .padding(.horizontal)
        .appBackground
    }
}

#Preview {
    SignInView()
}
