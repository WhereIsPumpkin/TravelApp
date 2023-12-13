//
//  HotelsView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

import SwiftUI

struct HotelsView: View {
    var destination: Destination
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Image("hotel")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 230)
                .clipped()

            Text("Explore Our Hotels")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            ScrollView {
                ForEach(destination.hotels, id: \.self) { hotel in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "building.fill") 
                                .foregroundColor(Color("textColor"))
                                .font(.title2)

                            VStack(alignment: .leading) {
                                Text(hotel.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(hotel.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .shadow(radius: 2)
                    }
                    .padding(.horizontal)
                }
            }

            Button(action: {
                path = NavigationPath()
            }, label: {
                Label("Go To HomePage", systemImage: "house.fill")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color("textColor"))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            })
            .padding()

            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HotelsView(destination: previewExample, path: .constant(NavigationPath()))
}

