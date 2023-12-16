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
    @Environment(TravelAppViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            Image("mustSee")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 230)
            
            List(destination.mustSee, id: \.self) { mustSee in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        
                        Image(systemName: "building.columns.fill")
                            .foregroundColor(Color("textColor"))
                            .font(.title)
                        
                        VStack(alignment: .leading) {
                            Text(mustSee.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text(mustSee.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
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
    MustSeeView(destination: previewExample)
}
