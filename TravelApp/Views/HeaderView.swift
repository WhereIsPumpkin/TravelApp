//
//  HeaderView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe.europe.africa.fill")
                .font(.title)
                .foregroundStyle(Color("mainGreen"))
            
            Spacer()
            
            Image("profilePic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
        }
        
        Text("Start enjoying your ")
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.black)
        + Text("vacation")
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(Color("mainGreen"))
        + Text(" with us!")
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.black)
    }
}

#Preview {
    HeaderView()
}
