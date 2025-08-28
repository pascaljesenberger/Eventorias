//
//  WelcomeView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigateToSignIn = false

    var body: some View {
        VStack(spacing: 64) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 242, maxHeight: 120)
            
            CustomButton(
                action: { navigateToSignIn = true },
                title: "Sign in with email",
                image: Image("IconMail"),
                width: 242,
            )
            
            Spacer()
        }
        .padding(.top, 142)
        .navigationDestination(isPresented: $navigateToSignIn) {
            SignInView()
        }
        .appBackground
    }
}

#Preview {
    WelcomeView()
}
