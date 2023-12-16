//
//  TravelAppViewModel.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import NetSwift
import SwiftUI

@Observable
final class TravelAppViewModel {
    // MARK: - Properties
    var destinations: [Destination] = []
    var error: String?
    var path = NavigationPath()
    var showAlert = false
    var currentTip = ""
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    enum NavigationTarget {
        case transport
        case mustSee
        case hotel
    }
    
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
           return travelTips.randomElement() ?? "Enjoy your trip!"
    }
}
