//
//  DestinationDetailView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct DestinationDetailView: View {
    var destination: Destination
    @State private var selectedImageIndex = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<destination.generalImages.count, id: \.self) { index in
                    Image(destination.generalImages[index])
                        .resizable()
                        .frame(width: 400, height: 390)
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 280)
            .onAppear {
                selectedImageIndex = 0
            }
            
            HStack() {
                Spacer()
                ForEach(0..<destination.generalImages.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedImageIndex ? Color.primary : Color.secondary)
                        .frame(width: 8, height: 8)
                }
                Spacer()
            }
            
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
                    
                    VStack (spacing: 20) {
                        CustomButton(width: view.size.width - 44, action: {
                            print("hey")
                        }, title: "Transport", systemImageName: "bus", color: Color("textColor"))
                        
                        CustomButton(width: view.size.width - 44, action: {
                            print("hey")
                        }, title: "Must See", systemImageName: "building.columns", color: Color(red: 0, green: 0.5, blue: 0.98))
                        
                        CustomButton(width: view.size.width - 44, action: {
                            print("hey")
                        }, title: "Hotel", systemImageName: "building.fill", color: Color(red: 0.33, green: 0.59, blue: 1))
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
    DestinationDetailView(destination: Destination(
        id: 1,
        cityName: "Tbilisi",
        country: "Georgia",
        mainImage: "main",
        description: "Tbilisi is the capital of Georgia, known for its diverse architecture, vibrant arts scene, and rich history.",
        generalImages: ["image1", "image2", "image3"],
        transport: [
            Transport(image: "transport1", name: "Metro System", description: "Efficient metro system for convenient city travel.", price: "$2 per trip"),
            Transport(image: "transport2", name: "Taxi Service", description: "Explore Tbilisi with comfortable taxi services.", price: "$15 per ride")
        ],
        mustSee: [
            MustSee(image: "must_see1", name: "Narikala Fortress", description: "Ancient fortress offering panoramic views of the city."),
            MustSee(image: "must_see2", name: "Old Town (Dzveli Tbilisi)", description: "Historic district with charming cobblestone streets and colorful houses.")
        ],
        hotels: [
            Hotel(image: "hotel1", name: "Boutique Hotel", description: "Elegant boutique hotel for a luxurious stay."),
            Hotel(image: "hotel2", name: "Guesthouse", description: "Cozy guesthouse providing a homely atmosphere for travelers on a budget.")
        ],
        isTrending: true,
        rating: 4
    ))
}
