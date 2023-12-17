//
//  DestinationModel.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import Foundation

struct DestinationsData: Decodable {
    let destinations: [Destination]
}

struct Destination: Decodable, Identifiable, Hashable {
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

struct Transport: Decodable, Hashable {
    let image: String
    let name: String
    let description: String
    let price: String
}

struct MustSee: Decodable, Hashable {
    let image: String
    let name: String
    let description: String
}

struct Hotel: Decodable, Hashable {
    let image: String
    let name: String
    let description: String
}
