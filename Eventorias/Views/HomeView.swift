//
//  HomeView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 26/08/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: String = "Events"
    
    var body: some View {
        VStack {
            ZStack {
                if selectedTab == "Events" {
                    EventsView()
                } else if selectedTab == "Profile" {
                    ProfileView()
                }
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .appBackground
    }
}

#Preview {
    HomeView()
}
