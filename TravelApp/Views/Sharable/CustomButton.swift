//
//  customButton.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

import SwiftUI

struct CustomButton: View {
    
    var width: CGFloat
    var action: () -> Void
    var title: String
    var systemImageName: String
    var color: Color
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Label(title, systemImage: systemImageName)
                .font(.headline)
                .frame(width: width, height: 70)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        })
    }
}

#Preview {
    CustomButton(width: 200, action: {print("Test")}, title: "Transport", systemImageName: "bus", color: Color("textColor"))
}
