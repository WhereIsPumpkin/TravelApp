//
//  TravelAppViewModel.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import NetSwift
import SwiftUI

enum NavigationTarget {
    case transports
    case mustSeePlaces
    case hotels
}

final class MainViewModel: ObservableObject {
    // MARK: - Properties
    @Published var destinations: [Destination] = []
    @Published var error: String?
    @Published var showAlert = false
    @Published var currentTip = ""   

    // MARK: - Initialization
    init() {
        fetchDestinations()
    }
    
    // MARK: - Network Call
    func fetchDestinations() {
        let urlString = "https://mocki.io/v1/d840e078-32ab-4346-aa7d-d782841267c9"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: DestinationsData.self, completion: { result in
            switch result {
            case .success(let data):
                self.destinations = data.destinations
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }

    // MARK: - Utility Methods
    func getRandomTravelTip() -> String {
        TravelTipsMockData.travelTips.randomElement() ?? "Enjoy your trip!"
    }
}
