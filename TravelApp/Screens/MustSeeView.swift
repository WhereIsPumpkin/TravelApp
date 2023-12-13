//
//  MustSeeView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

// MustSeeView.swift
import SwiftUI

struct MustSeeView: View {
    var destination: Destination
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Image("mustSee")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: .infinity, height: 230)
                .clipped()

            ScrollView {
                ForEach(destination.mustSee, id: \.self) { attraction in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "star.fill") // Icon representing the attraction
                                .foregroundColor(Color("textColor"))
                                .font(.title2)

                            VStack(alignment: .leading) {
                                Text(attraction.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(attraction.description)
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
            .background(Color(.systemGray6))
            
            
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
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MustSeeView(destination: previewExample, path: .constant(NavigationPath()))
}
