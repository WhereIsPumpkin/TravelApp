//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

@main
struct TravelAppApp: App {
    var viewModel = TravelAppViewModel()
    
    var body: some Scene {
        WindowGroup {
            TravelAppMainView()
                .environment(viewModel)
        }
    }
}
