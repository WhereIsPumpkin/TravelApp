//
//  DestinationDetailViewModel.swift
//  TravelApp
//
//  Created by Nana Jimsheleishvili on 17.12.23.
//

import SwiftUI

final class DestinationDetailViewModel: ObservableObject {
    // MARK: - Properties
    let destination: Destination
    @Binding var path: NavigationPath
    
    var cityName: String {
        destination.cityName
    }

    var country: String {
        destination.country
    }

    var description: String {
        destination.description
    }

    var generalImages: [String] {
        destination.generalImages
    }

    // MARK: - Init
    init(destination: Destination, path: Binding<NavigationPath>) {
        self.destination = destination
        self._path = path
    }
}
