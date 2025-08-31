//
//  EventDetailView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 01/09/2025.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    
    private var formattedDate: String {
        DateHelper.formatDate(event.date)
    }
    
    private var formattedTime: String {
        DateHelper.formatTime(event.time)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                if let urlString = event.image, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 364)
                            .cornerRadius(12)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 364)
                            .cornerRadius(12)
                    }
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 364)
                        .cornerRadius(12)
                }
                HStack {
                    VStack(alignment: .leading) {
                        HStack(spacing: 12) {
                            Image("EventIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                
                            Text(formattedDate)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        HStack(spacing: 12) {
                            Image("ClockIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text(formattedTime)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    
                    if let urlString = event.profileImageURL, let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            Circle().fill(Color.gray)
                        }
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    } else {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 40, height: 40)
                    }
                }
            }
            .padding(.horizontal)
        }
        .appBackground
        .customBackToolbar(text: event.title)
    }
}

#Preview {
    EventDetailView(event: .preview)
}
