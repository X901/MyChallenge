////
//OfferView.swift
//MyChallenge
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct OfferView: View {
    let title: String
    let color: Color
    var fontSize: CGFloat = 12
    let size: CGSize

    var body: some View {
        Group {
            Rectangle()
                .fill(color)
                .frame(width: size.width, height: size.height)

            Text(title)
                .foregroundColor(.white)
                .applyDynamicFont(size: fontSize)
                .lineLimit(1)
                .frame(width: 100)
        }
        .rotationEffect(Angle(degrees: -45))
    }
}
