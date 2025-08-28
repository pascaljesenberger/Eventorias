//
//  CustomTextField.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 29/08/2025.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var width: CGFloat? = nil
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.appDarkGray)
                .frame(height: 56)
                .frame(maxWidth: width == nil ? .infinity : width)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.custom("Inter", size: 12).weight(.regular))
                    .foregroundColor(.appGray)
                
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.custom("Inter", size: 16).weight(.regular))
                            .foregroundColor(.appLightGray)
                    }
                    
                    TextField("", text: $text)
                        .font(.custom("Inter", size: 16).weight(.regular))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    return CustomTextField(
        title: "Email",
        placeholder: "Enter your email",
        text: $text
    )
    .padding()
}
