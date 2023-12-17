//
//  InformationView.swift
//  TravelApp
//
//  Created by Nana Jimsheleishvili on 17.12.23.
//

import SwiftUI

struct InformationView: View {
    // MARK: - Properties
    @StateObject var viewModel: InformationViewModel

    // MARK: - Body
    var body: some View {
        VStack {
            headerImageView
            listView
            goToHomeButton
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Header
    private var headerImageView: some View {
        Image(viewModel.headerImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: 230)
    }
    
    // MARK: - List
    private var listView: some View {
        List(viewModel.items, id: \.self) { item in
            itemRow(item)
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    private func itemRow(_ item: InformationItemModel) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: viewModel.systemImageName)
                    .foregroundColor(Color("textColor"))
                    .font(.title)
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(item.description)
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
    
    // MARK: - HomeButton
    private var goToHomeButton: some View {
        Button(action: {
            viewModel.goToHomeButtonTapped()
        }){
            Label("Go To HomePage", systemImage: "house.fill")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color("textColor"))
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .padding()
    }
}
