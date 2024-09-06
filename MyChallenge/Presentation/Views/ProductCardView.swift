////
//ProductCardView.swift
//MyChallenge
//
//Created by Basel Baragabah on 06/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct ProductCardView: View {
    var title: String
    var subtitle: String
    var pricae: Int
    var offer: String

    var body: some View {
        Group {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .frame(width: 180, height: 220, alignment: .center)
            .overlay {
                VStack {
                    Image(.product)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .padding(.vertical, 5)
                    
                    VStack {
                        Text(title)
                            .regular(size: 15)
                            .foregroundColor(.accentColor)
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding(.horizontal, 10)
                        
                        Text(subtitle)
                            .regular(size: 12)
                            .foregroundColor(.accentColor.opacity(0.5))
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding(.horizontal, 10)
                        
                        
                        
                        Text("SAR \(pricae)")
                            .regular(size: 12)
                            .foregroundColor(.accentColor.opacity(0.7))
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding(.horizontal, 10)
                            .padding(.top, 5)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("أضيف للسلة")
                            .regular(size: 14)
                            .foregroundColor(.white)
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                    
                    .background(Color.accentColor)
                    .buttonBorderShape(.roundedRectangle)
                    .customCornerRadius(10)
                    .padding(.horizontal, 5)
                    
                    
                }
                
                Group {
                    Rectangle()
                        .fill(Color.accentColor)
                        .frame(width: 140, height: 25)
                    
                    Text(offer)
                        .foregroundColor(.white)
                        .regular(size: 12)
                    
                }
                .rotationEffect(Angle(degrees: -45))
                .offset(x: -55, y: -70)
            }
            .clipped()
            }
    }
}


#Preview {
    ProductCardView(title: "عطر فكتوريا سكرت",
                    subtitle: "عرض خاص",
                    pricae: 100,
                    offer: "تخفيض")
}
