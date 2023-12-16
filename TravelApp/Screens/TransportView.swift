//
//  TransportView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

import SwiftUI

struct TransportView: View {
    var destination: Destination
    @Environment(TravelAppViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            Image("public-transport")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 230)
                
            List(destination.transport, id: \.self) { transport in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        
                        Image(systemName: "bus")
                            .foregroundColor(Color("textColor"))
                            .font(.title)
                        
                        VStack(alignment: .leading) {
                            Text(transport.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(transport.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(transport.price)
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(Color("textColor"))
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 3)
                
            }
            .listStyle(InsetGroupedListStyle())

            Button(action: {
                viewModel.path = NavigationPath()
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
    TransportView(destination: previewExample)
        .environment(TravelAppViewModel())
}
