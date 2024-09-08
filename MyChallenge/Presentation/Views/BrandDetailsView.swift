////
//BrandDetailsView.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct BrandDetailsView: View {
    @StateObject var viewModel: BrandDetailsViewModel = AppContainer.shared.container.resolve(BrandDetailsViewModel.self)!

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    @AppStorage("fontFamily") var fontFamily: String = ""

    var body: some View {
        
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()

                ScrollView {
                    VStack {
                        
                        // I see this in the design but not on API response, so I add it as local image
                        Image(.header)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.horizontal, 5)
                        
                        // I see this in the design but not on API response, so I add it as hardcoded
                        Text("""
                          Italian designer Giorgio Armani's name is synonymous with impeccable taste and classic style, and his line of fragrances is no different. Men can choose from a range of eau de toilettes like Acqua Di Gio and Code for Men, or upgrade to the hallmark Emporio Armani and Emporio Armani Diamonds colognes
                          """)
                        .applyDynamicFont(size: 15)
                        .padding()
                        .multilineTextAlignment(.center)
                        
                        VStack {
                            if viewModel.isLoading && viewModel.products.isEmpty {
                                ProgressView("Loading...")
                            } else {
                                LazyVGrid(columns: columns, spacing: 16) {
                                    ForEach(viewModel.products, id: \.id) { product in
                                        NavigationLink(destination: ProductDetailsView(id: product.id)) {
                                            ProductCardView(imageUrl: product.image.url,
                                                            title: product.name ?? "",
                                                            subtitle: product.subtitle ?? "",
                                                            price: product.price ?? 0.0,
                                                            offer: product.promotionTitle)
                                            
                                        }
                                        .task {
                                            await  viewModel.loadNextPage(currentPeoduct: product)
                                        }
                                        
                                    }
                                }
                                
                            }
                        }
                    }
                    .task {
                        await viewModel.loadBrandProducts()
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Armani")
                                .applyDynamicFont(size: 17)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    
                    if viewModel.isLoading && !viewModel.products.isEmpty {
                        ProgressView()
                    }
                    
                }
                .refreshable {
                    await viewModel.pullToRefresh()
                }
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
}

#Preview {
    BrandDetailsView()
}
