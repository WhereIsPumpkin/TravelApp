//
//  DestinationDetailView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 13.12.23.
//

import SwiftUI

struct DestinationDetailView: View {
    // MARK: - Properties
    @StateObject var viewModel: DestinationDetailViewModel

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            ImageCarouselComponentView(images: viewModel.generalImages)
            detailView
            Spacer()
        }
        .navigationTitle(viewModel.cityName)
        .background(Color(red: 0.9, green: 0.97, blue: 1))
        .ignoresSafeArea()
    }

    // MARK: - DetailView
    private var detailView: some View {
        GeometryReader { view in
            VStack(alignment: .leading) {
                titleSubtitleHStack
                Spacer().frame(height: 15)
                descriptionText
                Spacer().frame(height: 35)
                navigationLinksVStack
                Spacer()
            }
            .padding(.horizontal, 22)
            .padding(.top, 18)
            .background(.white)
        }
    }

    private var titleSubtitleHStack: some View {
        HStack {
            TitleSubtitleComponentView(title: viewModel.cityName, subTitle: viewModel.country, titleFont: 21, subTitleFont: 14, alignmentAxe: .leading, titleWeight: .bold, subTitleWeight: .medium)
            Spacer()
            TitleSubtitleComponentView(title: "25$", subTitle: "Per Person", titleFont: 21, subTitleFont: 14, alignmentAxe: .trailing, titleWeight: .bold, subTitleWeight: .medium)
        }
    }

    private var descriptionText: some View {
        Text(viewModel.description)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(Color("textColor"))
    }

    // MARK: - NavigationLink
    private var navigationLinksVStack: some View {
        VStack {
            navigationLinkView(.transports, title: "Transport", systemImageName: "bus", color: Color("textColor"))
            navigationLinkView(.mustSeePlaces, title: "Must See", systemImageName: "building.columns", color: Color(red: 0, green: 0.5, blue: 0.98))
            navigationLinkView(.hotels, title: "Hotel", systemImageName: "building.fill", color: Color(red: 0.33, green: 0.59, blue: 1))
        }
        .navigationDestination(for: NavigationTarget.self) { navigationTarget in
            InformationView(viewModel: InformationViewModel(destination: viewModel.destination, detailType: navigationTarget, path: viewModel.$path))
        }
    }

    private func navigationLinkView(_ target: NavigationTarget, title: String, systemImageName: String, color: Color) -> some View {
        NavigationLink(value: target) {
            PrimaryButtonComponentView(
                width: UIScreen.main.bounds.width - 44,
                title: title,
                systemImageName: systemImageName,
                color: color
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    DestinationDetailView(viewModel: DestinationDetailViewModel(destination: DestinationMockData.previewExample, path: DestinationMockData().$path))
        .environmentObject(MainViewModel())
}
