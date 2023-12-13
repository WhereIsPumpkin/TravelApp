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

struct Destination: Codable {
    let cityName: String
    let mainImage: String
    let description: String
    let generalImages: [String]
    let transport: [Transport]
    let mustSee: [MustSee]
    let hotels: [Hotel]
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




