//
//  AppButton.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 28/08/2025.
//

import SwiftUI

struct CustomButton: View {
    let action: () -> Void
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let width: CGFloat?
    let height: CGFloat
    let title: String?
    let image: Image?
    
    init(
        action: @escaping () -> Void,
        title: String? = nil,
        image: Image? = nil,
        cornerRadius: CGFloat = 4,
        backgroundColor: Color = Color.appRed,
        width: CGFloat? = nil,
        height: CGFloat = 52
    ) {
        self.action = action
        self.title = title
        self.image = image
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
                
                if let title = title {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: width ?? .infinity)
            .frame(height: height)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack(spacing: 20) {
        CustomButton(
            action: { print("Text Only") },
            title: "Validate"
        )
        
        CustomButton(
            action: { print("Image Only") },
            image: Image("IconAttach"),
            cornerRadius: 16,
            width: 52,
        )
        
        CustomButton(
            action: { print("Image and Text") },
            title: "Sign in with email",
            image: Image("IconMail"),
            width: 242,
        )
    }
    .padding()
}
