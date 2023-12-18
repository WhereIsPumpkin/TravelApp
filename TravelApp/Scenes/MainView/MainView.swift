//
//  MainView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()

    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HeaderComponentView()
                    .frame(minHeight: 75)
                navigationStack
                travelTipButton
                Spacer()
            }
            .padding(24)
            .background(Color(red: 0.9, green: 0.97, blue: 1))
        }
    }
    
    // MARK: - Destinations Grid
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            horizontalScrollView
        }
    }

    private var horizontalScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            destinationGrid
        }
    }

    private var destinationGrid: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.destinations) { destination in
                destinationLink(destination)
            }
        }
    }

    private func destinationLink(_ destination: Destination) -> some View {
        NavigationLink(value: destination, label: {
            TravelCardComponentView(
                imageName: destination.mainImage,
                destinationName: destination.cityName,
                countryName: destination.country,
                rating: destination.rating
            )
        })
        .navigationDestination(for: Destination.self) {
            DestinationDetailView(viewModel: DestinationDetailViewModel(destination: $0, path: $path))
        }
    }

    // MARK: - TravelTip
    private var travelTipButton: some View {
        HStack {
            Spacer()
            Button("Get Travel Tip") {
                viewModel.currentTip = viewModel.getRandomTravelTip()
                viewModel.showAlert = true
            }
            .primaryButtonStyle
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Travel Tip"),
                    message: Text(viewModel.currentTip),
                    dismissButton: .default(Text("OK"))
                )
            }
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
