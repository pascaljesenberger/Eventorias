//
//  ErrorMessage.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 31/08/2025.
//

import SwiftUI

struct ErrorMessage: View {
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.appDarkGray)
                .frame(width: 64, height: 64)
                .overlay(
                    Image("ExclamationIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 5, height: 24)
                )
            
            Text("Error")
            
        }
    }
}

#Preview {
    ErrorMessage()
}
