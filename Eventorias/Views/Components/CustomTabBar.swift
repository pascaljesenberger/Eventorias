//
//  CustomTabBar.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 30/08/2025.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 46) {
            Spacer()
            
            TabBarItem(text: "Events", image: "EventIcon", selectedTab: $selectedTab)
                .onTapGesture { selectedTab = "Events" }
            
            TabBarItem(text: "Profile", image: "ProfileIcon", selectedTab: $selectedTab)
                .onTapGesture { selectedTab = "Profile" }
            
            Spacer()
        }
        .frame(height: 56)
    }
}

#Preview {
    @Previewable @State var selectedTab = "Events"
    CustomTabBar(selectedTab: $selectedTab)
}
