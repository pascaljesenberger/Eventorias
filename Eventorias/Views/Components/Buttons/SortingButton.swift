//
//  SortingButton.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 30/08/2025.
//

import SwiftUI

struct SortingButton: View {
    var text: String = "Sort"
    var image: Image? = Image("SortIcon")
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: 105, height: 35)
                .foregroundColor(.appDarkGray)
                .overlay(
                    HStack {
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12)
                        
                        Text(text)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                    }
                )
        }
        .padding(.horizontal)
    }
}

#Preview {
    SortingButton()
}
