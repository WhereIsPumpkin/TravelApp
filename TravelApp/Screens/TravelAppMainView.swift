//
//  ContentView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct TravelAppMainView: View {
    
    // MARK: - Properties
    @Environment(TravelAppViewModel.self) private var viewModel
    @State private var path = NavigationPath()
    @State private var showAlert = false
    @State private var currentTip = ""
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                // MARK: - Header View
                HeaderView()
                    .frame(minHeight: 75)
                
                // MARK: - Main Content
                NavigationStack(path: $path) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyVGrid(columns: viewModel.layout) {
                            ForEach(viewModel.destinations) { destination in
                                NavigationLink(value: destination, label: {
                                    TravelCardView(
                                        imageName: destination.mainImage,
                                        destinationName: destination.cityName,
                                        countryName: destination.country,
                                        rating: destination.rating
                                    )
                                })
                                .navigationDestination(for: Destination.self) { destination in
                                    DestinationDetailView(destination: destination, path: $path)
                                }
                            }
                        }
                    }
                }
                
                // MARK: - Travel Tip Section
                HStack {
                    Spacer()
                    Button("Get Travel Tip") {
                        currentTip = viewModel.getRandomTravelTip()
                        showAlert = true
                    }
                    .padding()
                    .background(Color("textColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Travel Tip"),
                            message: Text(currentTip),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    Spacer()
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

// MARK: - Preview
#Preview {
    TravelAppMainView()
        .environment(TravelAppViewModel())
}
