//
//  EventCreationView.swift
//  Eventorias
//
//  Created by Pascal Jesenberger on 01/09/2025.
//

import SwiftUI

struct EventCreationView: View {
    @StateObject private var viewModel = EventCreationViewModel()
    
    var body: some View {
        VStack(spacing: 22) {
            CustomTextField(
                title: "Title",
                placeholder: "New event",
                text: $viewModel.eventName
            )
            CustomTextField(
                title: "Description",
                placeholder: "Tap here to enter your description",
                text: $viewModel.eventDescription
            )
            HStack(spacing: 16) {
                CustomTextField(
                    title: "Date",
                    placeholder: "MM/DD/YYYY",
                    text: $viewModel.eventDate
                )
                
                CustomTextField(
                    title: "Time",
                    placeholder: "HH : MM",
                    text: $viewModel.eventTime
                )
            }
            CustomTextField(
                title: "Address",
                placeholder: "Enter full address",
                text: $viewModel.eventAddress
            )
            
            HStack(spacing: 16) {
                Spacer()
                CustomButton(
                    action: {},
                    image: Image("CameraIcon"),
                    cornerRadius: 16,
                    backgroundColor: .white,
                    width: 52,
                    height: 52,
                    imageSize: 20
                )
                CustomButton(
                    action: {},
                    image: Image("AttachIcon"),
                    cornerRadius: 16,
                    width: 52,
                    height: 52,
                    imageSize: 20
                )
                Spacer()
            }
            .padding(.top)
            
            Spacer()
            
            CustomButton(
                action: {},
                title: "Validate"
            )
        }
        .padding()
        .customBackToolbar(text: "Creation of an event")
        .appBackground
    }
}

#Preview {
    EventCreationView()
}
