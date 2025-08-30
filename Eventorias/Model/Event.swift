//
//  Event.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 30/08/2025.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var date: String
    var time: String
    var address: String
    var image: String?
    var profileImageURL: String?
}
