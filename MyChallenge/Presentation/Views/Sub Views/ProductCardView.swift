////
//ProductCardView.swift
//MyChallenge
//
//Created by Basel Baragabah on 06/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {
    let imageUrl: String?
    let title: String
    let subtitle: String
    let price: Double
    let offer: String

    @AppStorage("appColor") private var appColor: Int = 0
    @AppStorage("fontFamily") private var fontFamily: String = ""

    var body: some View {
        Group {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .frame(width: 180, height: 220, alignment: .center)
            .overlay {
                VStack {
                    
                    if let imageUrl {
                        KFImage(URL(string: imageUrl)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .padding(.vertical, 5)
                    } else {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 150)
                            .padding(.vertical, 5)
                            .overlay(alignment: .center) {
                                Image(.no)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundStyle(appColor.colorFromARGB())
                            }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(title)
                            .applyDynamicFont(size: 15)
                            .foregroundColor(appColor.colorFromARGB())
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding(.horizontal, 10)
                            .lineLimit(1)
                        
                        Text(subtitle)
                            .applyDynamicFont(size: 12)
                            .foregroundColor(appColor.colorFromARGB().opacity(0.5))
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding(.horizontal, 10)
                            .lineLimit(1)

                        

                        Text("SAR \(price.priceWithTwoDecimal())")
                            .applyDynamicFont(size: 12)
                            .foregroundColor(appColor.colorFromARGB().opacity(0.7))
                            .frame(maxWidth: .infinity ,alignment: .trailing)
                            .padding(.horizontal, 10)
                            .padding(.top, 5)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("أضيف للسلة")
                            .applyDynamicFont(size: 14)
                            .foregroundColor(.white)
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                    
                    .background(appColor.colorFromARGB())
                    .buttonBorderShape(.roundedRectangle)
                    .customCornerRadius(10)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)

                    
                    
                }
                
                if offer != "" {
                    OfferView(title: offer,
                              color: appColor.colorFromARGB(),
                              size: CGSize(width: 140, height: 25))
                              .offset(x: -55, y: -70)

                }
            }
            .clipped()
            }
    }
}


#Preview {
    ProductCardView(imageUrl: "https://picsum.photos/536/354",
                    title: "عطر فكتوريا سكرت",
                    subtitle: "عرض خاص",
                    price: 100.0,
                    offer: "تخفيض")
}

