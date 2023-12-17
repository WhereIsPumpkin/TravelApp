//
//  PrimaryButtonComponentView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

import SwiftUI

struct PrimaryButtonComponentView: View {
    
    var width: CGFloat
    var title: String
    var systemImageName: String
    var color: Color
    
    var body: some View {
            Label(title, systemImage: systemImageName)
                .font(.headline)
                .frame(width: width, height: 70)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    PrimaryButtonComponentView(width: 200, title: "Transport", systemImageName: "bus", color: Color("textColor"))
}
