//
//  SignInView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.system(size: 48, weight: .semibold))
                .foregroundColor(.white)
                
            VStack(spacing: 24) {
                CustomTextField(
                    title: "Email",
                    placeholder: "Enter your email",
                    text: $email
                )
                
                CustomTextField(
                    title: "Password",
                    placeholder: "Enter your password",
                    text: $password
                )
            }
            .padding(.vertical, 34)
            
            CustomButton(
                action: { print("") },
                title: "Sign In",
                width: 242,
            )
            
            Spacer()
        }
        .padding(.top, 84)
        .padding(.horizontal)
        .ignoresSafeArea(.keyboard)
        .appBackground
        .customBackToolbar(text: "Back")
    }
}

#Preview {
    SignInView()
}
