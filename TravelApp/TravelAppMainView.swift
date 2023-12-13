//
//  ContentView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct TravelAppMainView: View {
    
    @Environment(TravelAppViewModel.self) private var viewModel
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HeaderView()
                NavigationStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyVGrid(columns: viewModel.layout) {
                            ForEach(viewModel.destinations) { destination in
                                NavigationLink(destination: DestinationDetailView(destination: destination)) {
                                    TravelCardView(
                                        imageName: destination.mainImage,
                                        destinationName: destination.cityName,
                                        countryName: destination.country,
                                        rating: destination.rating
                                    )
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(24)
            .background(Color(red: 0.9, green: 0.97, blue: 1))
            .onAppear {
                viewModel.fetchDestinations()
            }
        }
        
    }
    
    
    
}

#Preview {
    TravelAppMainView()
        .environment(TravelAppViewModel())
}