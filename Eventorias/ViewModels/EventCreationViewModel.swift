//
//  EventCreationViewModel.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 05/09/2025.
//

import Foundation

class EventCreationViewModel: ObservableObject {
    @Published var eventName = ""
    @Published var eventDescription = ""
    @Published var eventDate = ""
    @Published var eventTime = ""
    @Published var eventAddress = ""
}
