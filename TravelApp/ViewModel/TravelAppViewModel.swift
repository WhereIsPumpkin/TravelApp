//
//  TravelAppViewModel.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import Foundation
import NetSwift
import Observation
import SwiftUI

@Observable
class TravelAppViewModel {
    var destinations: [Destination] = []
    var error: String?
    var path = NavigationPath()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
}
