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
            
            if selectedTab == "Events" {
                CustomButton(
                    action: { print("") },
                    image: Image("PlusIcon"),
                    cornerRadius: 16,
                    width: 56,
                    imageSize: 18
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .appBackground
    }
}

#Preview {
    HomeView()
}
