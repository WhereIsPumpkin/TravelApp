//
//  DestinationDetailView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct DestinationDetailView: View {
    // MARK: - Properties
    var destination: Destination
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            ImageCarouselView(images: destination.generalImages)
            
            GeometryReader { view in
                VStack(alignment: .leading) {
                    HStack {
                        VStackTextView(title: destination.cityName, subTitle: destination.country, titleFont: 21, subTitleFont: 14, alignmentAxe: .leading, titleWeight: .bold, subTitleWeight: .medium )
                        
                        Spacer()
                        
                        VStackTextView(title: "25$", subTitle: "Per Person", titleFont: 21, subTitleFont: 14, alignmentAxe: .trailing, titleWeight: .bold, subTitleWeight: .medium)
                    }
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Text(destination.description)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(Color("textColor"))
                    
                    Spacer()
                        .frame(height: 35)
                    
                    VStack {
                        NavigationLink(value: TravelAppViewModel.NavigationTarget.transport) {
                            CustomButtonView(
                                width: UIScreen.main.bounds.width - 44,
                                title: "Transport",
                                systemImageName: "bus",
                                color: Color("textColor")
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(value: TravelAppViewModel.NavigationTarget.mustSee) {
                            CustomButtonView(
                                width: UIScreen.main.bounds.width - 44,
                                title: "Must See",
                                systemImageName: "building.columns",
                                color: Color(red: 0, green: 0.5, blue: 0.98)
                            )
                        }
                        
                        NavigationLink(value: TravelAppViewModel.NavigationTarget.hotel) {
                            CustomButtonView(
                                width: UIScreen.main.bounds.width - 44,
                                title: "Hotel",
                                systemImageName: "building.fill",
                                color: Color(red: 0.33, green: 0.59, blue: 1)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .navigationDestination(for: TravelAppViewModel.NavigationTarget.self) { navigationTarget in
                        switch navigationTarget {
                        case .transport:
                            TransportView(destination: destination)
                        case .mustSee:
                            MustSeeView(destination: destination)
                        case .hotel:
                            HotelsView(destination: destination)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 22)
                .padding(.top, 18)
                .background(.white)
            }
            Spacer()
            
        }
        .navigationTitle(destination.cityName)
        .background(Color(red: 0.9, green: 0.97, blue: 1))
        .ignoresSafeArea()
    }
}

#Preview {
    DestinationDetailView(destination: previewExample)
        .environment(TravelAppViewModel())
}
