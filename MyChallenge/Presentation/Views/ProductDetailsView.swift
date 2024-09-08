////
//ProductDetailsView.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI
import Kingfisher

struct ProductDetailsView: View {
    
    let id: String
    
    @AppStorage("appColor") private var appColor: Int = 0
    @AppStorage("fontFamily") private var fontFamily: String = ""
    
    @Environment(\.dismiss) private var dismiss

    @StateObject private var viewModel: ProductDetailsViewModel = AppContainer.shared.container.resolve(ProductDetailsViewModel.self)!
    
    var body: some View {
        Group {
            
            if viewModel.isLoading && viewModel.product == nil {
                ProgressView("Loading...")
                
            } else {
                VStack(spacing: 0) {
 
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 60)
                        .shadow(color: .gray.opacity(0.1), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                        .overlay {
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "chevron.backward")
                                        .imageScale(.large)
                                        .foregroundStyle(appColor.colorFromARGB())
                                }
                                
                                Spacer()

                                Text(viewModel.product?.name ?? "")
                                    .applyDynamicFont(size: 20)
                             
                                Spacer()
                                
                                // This's a trick to make text on center, that why it's hidden
                                Image(systemName: "chevron.backward")
                                    .imageScale(.large)
                                    .hidden()
                            }
                            .padding()
                        }
                    
                    ZStack {
                        Color.gray.opacity(0.1)
                        
                        VStack {
                            
                            if let imageUrl = viewModel.product?.image.url {
                                KFImage(URL(string: imageUrl)!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(.vertical, 5)
                            } else {
                                Rectangle()
                                    .fill(Color.white)
                                    .padding(30)
                                    .overlay(alignment: .center) {
                                        Image(.no)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .foregroundStyle(appColor.colorFromARGB())
                                    }
                            }
                            
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.opacity(0.6))
                                .frame(height: 200)
                                .shadow(color: .gray.opacity(0.1), radius: 5, x: 0.0, y: -5)
                                .overlay(alignment: .trailing) {
                                    bottomTexts()
                                }
                                .overlay(alignment: .leading) {
                                    shareAndLikeButtons()
                                }
                            
                            
                        }
                        .clipped()
                        
                        
                    }
                    
                    .overlay(alignment: .topLeading) {
                        if let promotionTitle = viewModel.product?.promotionTitle {
                            OfferView(title: promotionTitle,
                                      color: appColor.colorFromARGB(),
                                      fontSize: 20,
                                      size: CGSize(width: 250, height: 45))
                            .offset(x: -55, y: 50)
                        }
                    }
                    .clipped()
                    .ignoresSafeArea()
                    
                    
                    
                }
                .alert(isPresented: $viewModel.displayErrorAlert) {
                           Alert(
                               title: Text("Error"),
                               message: Text(viewModel.errorMessage ?? "unknown error."),
                               dismissButton: .default(Text("OK"))
                           )
                       }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .task {
            await viewModel.loadProductInformation(id: self.id)
        }
    }
    
    @ViewBuilder func shareAndLikeButtons() -> some View {
        HStack(spacing: 0) {
            Button {
                
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 70, height: 70)
                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0.0, y: 8)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundStyle(Color.gray)
                    }
                
            }
            .offset(y: -100)
            .padding(.leading, 30)
            
            
            Button {
                
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 70, height: 70)
                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0.0, y: 8)
                    .overlay {
                        Image(.share)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundStyle(Color.gray)
                    }
                
            }
            .offset(y: -100)
            .padding(.leading)
            
        }

    }
    
    @ViewBuilder func bottomTexts() -> some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(viewModel.product?.name ?? "")
                .applyDynamicFont(size: 25)
                .foregroundStyle(appColor.colorFromARGB())
            
            Text(viewModel.product?.subtitle ?? "")
                .applyDynamicFont(size: 18)
                .foregroundStyle(appColor.colorFromARGB().opacity(0.6))
            
            Text("SAR \((viewModel.product?.price ?? 0).priceWithTwoDecimal())")
                .applyDynamicFont(size: 18)
                .foregroundStyle(appColor.colorFromARGB())
            
            
        }
        .padding(.trailing)

    }
}

#Preview {
    ProductDetailsView(id: "599203108")
}
