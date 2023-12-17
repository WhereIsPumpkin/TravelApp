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
    
    // MARK: - Body
    var body: some View {
        // მოკლედ აქ პრობლემა მქონდა შემდეგი: ამ ახალი @Enveironment ით "დაჭერილ" viewModel-ის binding-ად ჩაწოდება არ შემეძლო, შესაბამისად აღმოვაჩინე შემდეგი სოლუშენი: https://developer.apple.com/forums/thread/732658, ამ შემთხვევაში body-ში გვიწერია რადგან  ჯერ ლოკალურად, რომ დავწეროთ body-ს გარეთ viewmodel-ის ინიციალიზაცია დამთავრებული არ ექნება და ვერ შევძლებთ. "Use this same approach when you need a binding to a property of an observable object stored in a view’s environment. https://developer.apple.com/documentation/swiftui/bindable
        @Bindable var viewModel = viewModel
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                
                // MARK: - Header View
                HeaderView()
                    .frame(minHeight: 75)
                
                // MARK: - Main Content
                NavigationStack(path: $viewModel.path) {
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
                                    DestinationDetailView(destination: destination)
                                }
                            }
                        }
                    }
                }
                
                // MARK: - Travel Tip Section
                HStack {
                    Spacer()
                    Button("Get Travel Tip") {
                        viewModel.currentTip = viewModel.getRandomTravelTip()
                        viewModel.showAlert = true
                    }
                    .padding()
                    .background(Color("textColor"))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(
                            title: Text("Travel Tip"),
                            message: Text(viewModel.currentTip),
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
