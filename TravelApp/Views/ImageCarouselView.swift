//
//  ImageCarouselVIEW.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

import SwiftUI

struct ImageCarouselView: View {
    @State private var selectedImageIndex = 0
    var images: [String] 

    var body: some View {
        VStack {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .frame(width: 400, height: 390)
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 280)
            .onAppear {
                selectedImageIndex = 0
            }

            HStack {
                Spacer()
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedImageIndex ? Color.primary : Color.secondary)
                        .frame(width: 8, height: 8)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ImageCarouselView(images: ["image1", "image2", "image3"])
}
        


