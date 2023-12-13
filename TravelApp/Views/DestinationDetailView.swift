//
//  DestinationDetailView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct DestinationDetailView: View {
    var destination: Destination

    var body: some View {
        VStack {
            Image(destination.mainImage)
                .resizable()
                .scaledToFit()
            Text(destination.cityName)
            Text(destination.country)
            Text("Rating: \(destination.rating)")
        }
        .navigationTitle(destination.cityName)
    }
}


//#Preview {
//    DestinationDetailView()
//}
