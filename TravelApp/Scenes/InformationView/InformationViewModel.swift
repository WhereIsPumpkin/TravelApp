//
//  InformationViewModel.swift
//  TravelApp
//
//  Created by Nana Jimsheleishvili on 17.12.23.
//

import SwiftUI

final class InformationViewModel: ObservableObject {
    // MARK: - Properties
    private let destination: Destination
    private let detailType: NavigationTarget
    @Binding var path: NavigationPath

    var items: [InformationItemModel] {
        switch detailType {
        case .transports:
            return destination.transport.map { .init(name: $0.name, description: $0.description, image: $0.image, price: $0.price) }
        case .mustSeePlaces:
            return destination.mustSee.map { .init(name: $0.name, description: $0.description, image: $0.image) }
        case .hotels:
            return destination.hotels.map { .init(name: $0.name, description: $0.description, image: $0.image) }
        }
    }

    var headerImageName: String {
        switch detailType {
        case .transports:
            return "public-transport"
        case .mustSeePlaces:
            return "mustSee"
        case .hotels:
            return "hotel"
        }
    }

    var systemImageName: String {
        switch detailType {
        case .transports:
            return "bus"
        case .mustSeePlaces:
            return "building.columns.fill"
        case .hotels:
            return "building.fill"
        }
    }

    // MARK: - Init
    init(destination: Destination, detailType: NavigationTarget, path: Binding<NavigationPath>) {
        self.destination = destination
        self.detailType = detailType
        self._path = path
    }
    
    func goToHomeButtonTapped() {
        path.removeLast(path.count)
    }
}
