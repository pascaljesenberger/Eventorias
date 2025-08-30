//
//  EventsView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 30/08/2025.
//

import SwiftUI

struct EventsView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            CustomSearchBar(
                searchText: $searchText,
                action: { print("") },
                onCancel: { searchText = "" }
            )
            .padding(.top, 24)
            
            ScrollView {
                VStack {
                    Text("EventsView")
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .appBackground
    }
}

#Preview {
    EventsView()
}
