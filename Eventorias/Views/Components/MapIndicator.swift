//
//  MapIndicator.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 01/09/2025.
//

import SwiftUI
import MapKit

struct MapIndicator: View {
    let latitude: Double
    let longitude: Double
    
    @State private var position: MapCameraPosition
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )
        _position = State(initialValue: MapCameraPosition.region(region))
    }
    
    var body: some View {
        Map(position: $position, interactionModes: []) {
            Marker("Position", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
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
