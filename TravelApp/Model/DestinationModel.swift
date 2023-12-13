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

struct Destination: Codable, Identifiable {
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

struct Transport: Codable {
    let image: String
    let name: String
    let description: String
    let price: String
}

struct MustSee: Codable {
    let image: String
    let name: String
    let description: String
}

struct Hotel: Codable {
    let image: String
    let name: String
    let description: String
}
