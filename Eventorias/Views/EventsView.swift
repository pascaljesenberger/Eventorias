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
            
            List(eventManager.events) { event in
                VStack(alignment: .leading, spacing: 8) {
                    Text(event.title)
                        .font(.headline)
                    Text(event.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(event.date) - \(event.time)")
                        .font(.caption)
                }
                .padding(.vertical, 4)
            }
            .listStyle(.plain)
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
