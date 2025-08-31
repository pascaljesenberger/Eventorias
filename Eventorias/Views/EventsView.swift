//
//  EventsView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 30/08/2025.
//

import SwiftUI

struct EventsView: View {
    @StateObject private var eventManager = EventManager()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack(spacing: 14) {
            CustomSearchBar(
                searchText: $searchText,
                action: { print("") },
                onCancel: { searchText = "" }
            )
            .padding(.top, 24)
            
            SortingButton()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(eventManager.events) { event in
                        EventRow(
                            imageURL: event.image,
                            title: event.title,
                            profileImageURL: event.profileImageURL,
                            date: event.date
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            eventManager.fetchEvents()
        }
        .appBackground
    }
}

#Preview {
    EventsView()
}
