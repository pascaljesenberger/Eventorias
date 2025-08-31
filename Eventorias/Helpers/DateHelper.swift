//
//  DateHelper.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 31/08/2025.
//

import Foundation

struct DateHelper {
    
    static func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let dateObj = formatter.date(from: dateString) {
            formatter.dateStyle = .long
            return formatter.string(from: dateObj)
        }
        return dateString
    }
}
