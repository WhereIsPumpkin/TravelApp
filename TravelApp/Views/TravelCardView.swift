//
//  TravelCardView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct TravelCardView: View {
    var imageName: String 
    var destinationName: String
    var countryName: String
    var rating: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 202, height: 157)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                VStackTextView(title: destinationName, subTitle: countryName, titleFont: 15, subTitleFont: 11, alignmentAxe: .leading, titleWeight: .semibold, subTitleWeight: .light)
                
                Spacer()
                
                Label(title: {
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundStyle(.white)
                }) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color(red: 1, green: 0.78, blue: 0))
                        .font(.system(size: 10))
                }
                .frame(width: 42, height: 18)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(red: 0.37, green: 0.41, blue: 0.5))
                .clipShape(RoundedRectangle(cornerRadius: 50))
            }
        }
        .frame(maxWidth: 230)
        .padding(EdgeInsets(top: 14, leading: 14, bottom: 20, trailing: 14))
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    TravelCardView(imageName: "main", destinationName: "Mount Bromo", countryName: "Indonesia", rating: 4.6)
}


