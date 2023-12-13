//
//  DestinationModel.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import Foundation

struct DestinationsData: Codable {
    let destinations: [Destination]
}

struct Destination: Codable, Identifiable, Hashable {
    let id: Int
    let cityName: String
    let country: String
    let mainImage: String
    let description: String
    let generalImages: [String]
    let transport: [Transport]
    let mustSee: [MustSee]
    let hotels: [Hotel]
    let isTrending: Bool
    let rating: Double
}

struct Transport: Codable, Hashable {
    let image: String
    let name: String
    let description: String
    let price: String
}

struct MustSee: Codable, Hashable {
    let image: String
    let name: String
    let description: String
}

struct Hotel: Codable, Hashable {
    let image: String
    let name: String
    let description: String
}

let previewExample = Destination(
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

let travelTips = [
    "Pack light and efficiently",
    "Always have a copy of your important documents",
    "Learn basic phrases of the local language",
    "Keep your belongings safe",
    "Try local foods",
    "Respect local customs and traditions",
    "Stay hydrated and take care of your health",
    "Plan your itinerary but be flexible",
    "Check for travel advisories and safety tips",
    "Keep an open mind and enjoy your journey"
]
