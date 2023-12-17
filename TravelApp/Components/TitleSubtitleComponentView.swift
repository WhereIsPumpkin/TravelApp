//
//  TitleSubtitleComponentView.swift
//  TravelApp
//
//  Created by Saba Gogrichiani on 14.12.23.
//

import SwiftUI

struct TitleSubtitleComponentView: View {
    
    var title: String
    var subTitle: String
    var titleFont: CGFloat
    var subTitleFont: CGFloat
    var alignmentAxe: HorizontalAlignment
    var titleWeight: Font.Weight
    var subTitleWeight: Font.Weight
    
    var body: some View {
        VStack(alignment: alignmentAxe) {
            Text(title)
                .font(.system(size: titleFont, weight: titleWeight))
                .foregroundColor(Color("textColor"))
            Text(subTitle)
                .font(.system(size: subTitleFont, weight: subTitleWeight))
                .foregroundColor(Color("textColor"))
        }
    }
}

#Preview {
    TitleSubtitleComponentView(title: "Test", subTitle: "Test", titleFont: 15, subTitleFont: 11, alignmentAxe: .leading, titleWeight: .bold, subTitleWeight: .light)
}
