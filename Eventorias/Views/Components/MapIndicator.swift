//
//  MapIndicator.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 01/09/2025.
//

import SwiftUI
import MapKit
import FirebaseFirestore

struct MapIndicator: View {
    let coordinate: CLLocationCoordinate2D
    
    init(latitude: Double, longitude: Double) {
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(geoPoint: GeoPoint?) {
        self.coordinate = CLLocationCoordinate2D(
            latitude: geoPoint?.latitude ?? 48.8566,
            longitude: geoPoint?.longitude ?? 2.3522
        )
    }
    
    var body: some View {
        Map(initialPosition: .region(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )), interactionModes: []) {
            Marker("Position", coordinate: coordinate)
                .tint(.red)
        }
        .frame(width: 149, height: 72)
        .cornerRadius(12)
        .allowsHitTesting(false)
    }
}

#Preview {
    MapIndicator(latitude: 48.8566, longitude: 2.3522)
        .padding()
}
