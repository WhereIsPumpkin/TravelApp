//
//  Button+Extension.swift
//  TravelApp
//
//  Created by Nana Jimsheleishvili on 16.12.23.
//

import SwiftUI

extension Button {
    var primaryButtonStyle: some View {
        self
        .padding()
        .background(Color("textColor"))
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}
