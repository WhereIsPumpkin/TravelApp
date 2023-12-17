//
//  DestinationMockData.swift
//  TravelApp
//
//  Created by Nana Jimsheleishvili on 16.12.23.
//

import SwiftUI

struct DestinationMockData {
    @State var path = NavigationPath()
    
    static let previewExample = Destination(
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
    )
}
