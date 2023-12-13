//
//  ContentView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
            
            Spacer()
        }
        .padding(24)
        .background(Color(red: 0.9, green: 1, blue: 1))
    }
}

#Preview {
    ContentView()
}
