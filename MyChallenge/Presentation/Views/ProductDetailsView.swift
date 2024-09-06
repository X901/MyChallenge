////
//ProductDetailsView.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct ProductDetailsView: View {
    @AppStorage("appColor") private var appColor: Int = 0
    @AppStorage("fontFamily") private var fontFamily: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 60)
                    .shadow(color: .gray.opacity(0.1), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                    .overlay {
                        Text("عطر شانجان")
                            .applyDynamicFont(size: 20)
                    }
 
                ZStack {
                    Color.gray.opacity(0.1)

                    VStack {
                        Image(.product)
                            .resizable()
                            .scaledToFit()
                            .padding(30)
                            
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.6))
                            .frame(height: 160)
                            .shadow(color: .gray.opacity(0.1), radius: 5, x: 0.0, y: -5)
                            .overlay {
                                
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text("عطر شانجان")
                                        .applyDynamicFont(size: 25)
                                        .foregroundStyle(appColor.colorFromARGB())
                                    
                                    Text("اشتري الأن وادفع الان")
                                        .applyDynamicFont(size: 18)
                                        .foregroundStyle(appColor.colorFromARGB().opacity(0.6))
                                    
                                    Text("SAR 100.00")
                                        .applyDynamicFont(size: 18)
                                        .foregroundStyle(appColor.colorFromARGB())


                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing)
                            }
                            .overlay(alignment: .leading) {

                                HStack(spacing: 0) {
                                    Button {
                                        
                                    } label: {
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 70, height: 70)
                                            .overlay {
                                                Image(systemName: "heart.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30)
                                                    .foregroundStyle(Color.gray)
                                            }

                                    }
                                    .offset(y: -80)
                                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0.0, y: 8)
                                    .padding(.leading, 30)

                                    
                                    Button {
                                        
                                    } label: {
                                        Circle()
                                            .fill(.white)
                                            .frame(width: 70, height: 70)
                                            .overlay {
                                                Image(.share)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 30)
                                                    .foregroundStyle(Color.gray)
                                            }

                                    }
                                    .offset(y: -80)
                                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0.0, y: 8)
                                    .padding(.leading)

                                }


                            }


                    }
                    .clipped()

                   
                }

                .overlay(alignment: .topLeading) {
                    OfferView(title: "عرض لايقاوم",
                              color: appColor.colorFromARGB(),
                              fontSize: 20,
                              size: CGSize(width: 250, height: 45))
                    .offset(x: -55, y: 50)
                }
                .clipped()
                .ignoresSafeArea()


                
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            
        }
    }
}

#Preview {
    ProductDetailsView()
}
