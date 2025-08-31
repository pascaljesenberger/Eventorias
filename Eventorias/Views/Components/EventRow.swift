//
//  EventRow.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 31/08/2025.
//

import SwiftUI

struct EventRow: View {
    var imageURL: String?
    var title: String
    var profileImageURL: String?
    var date: String
    
    private var formattedDate: String {
        DateHelper.formatDate(date)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.appDarkGray)
            
            HStack(spacing: 12) {
                HStack(spacing: 12) {
                    EventProfileImage(urlString: profileImageURL, imageSize: 40)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(title)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        
                        Text(formattedDate)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 12)
                
                Spacer(minLength: 0)
                
                if let urlString = imageURL, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 136, height: 80)
                            .clipped()
                            .cornerRadius(12)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 136, height: 80)
                            .cornerRadius(12)
                    }
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 136, height: 80)
                        .cornerRadius(12)
                }
            }
        }
        .frame(height: 80)
    }
}

#Preview {
    EventRow(
        imageURL: "https://media.discordapp.net/attachments/729528999335952444/1411497579295936602/course-marathons-urbains.jpeg?ex=68b4df0f&is=68b38d8f&hm=d97c5e6a3c5eb14579bb9a0d65528531dc87a303362449fd6750aa2f372ad1cb&=&format=webp&width=2048&height=1220",
        title: "Événement",
        profileImageURL: "https://media.discordapp.net/attachments/729528999335952444/1411501019573260359/pexels-photo-6694422.jpeg.webp?ex=68b4e243&is=68b390c3&hm=b85e50cc1353760a27d7ff832520c44d689c44451c6063d483dd3fdc99a8ef96&=&format=webp&width=1800&height=1200",
        date: "2025-09-15"
    )
    .frame(maxWidth: .infinity)
    .padding()
}
