//
//  SignUpView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .appBackground
        .customBackToolbar(text: "Back")
    }
}

#Preview {
    SignUpView()
}
