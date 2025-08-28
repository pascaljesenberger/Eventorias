//
//  EventoriasApp.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 26/08/2025.
//

import SwiftUI

@main
struct EventoriasApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WelcomeView()
            }
        }
    }
}
