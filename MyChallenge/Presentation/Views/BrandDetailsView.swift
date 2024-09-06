////
//BrandDetailsView.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct BrandDetailsView: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Image(.header)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal, 5)

                    Text("""
                          Italian designer Giorgio Armani's name is synonymous with impeccable taste and classic style, and his line of fragrances is no different. Men can choose from a range of eau de toilettes like Acqua Di Gio and Code for Men, or upgrade to the hallmark Emporio Armani and Emporio Armani Diamonds colognes
                          """)
                    .regular(size: 15)
                    .padding()
                    .multilineTextAlignment(.center)
                    
                    
                    HStack {
                        ProductCardView(title: "عطر فكتوريا سكرت",
                                        subtitle: "عرض خاص",
                                        pricae: 100,
                                        offer: "تخفيض")

                    }
                    .clipped()
                    
                }
            }
            .background(Color.gray.opacity(0.1))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Armani")
                        .regular(size: 17)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }


    }
}

#Preview {
    BrandDetailsView()
}
