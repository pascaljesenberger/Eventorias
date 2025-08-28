//
//  SignInView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack(spacing: 64) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 242, maxHeight: 120)
            
            CustomButton(
                action: { print("Image and Text") },
                title: "Sign in with email",
                image: Image("IconMail"),
                width: 242,
            )
            
            Spacer()
        }
        .padding(.top, 142)
        .appBackground
    }
}

#Preview {
    SignInView()
}
