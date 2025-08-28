//
//  SignUpTextLink.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct SignUpTextLink: View {
    @Binding var goToSignUp: Bool

    var body: some View {
        VStack(spacing: 6) {
            Text("Don't have an account?")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.gray)
            
            Text("Sign Up")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .underline()
        }
        .padding(.bottom)
        .onTapGesture {
            goToSignUp = true
        }
    }
}

#Preview {
    SignUpTextLink(goToSignUp: .constant(false))
        .appBackground
}
