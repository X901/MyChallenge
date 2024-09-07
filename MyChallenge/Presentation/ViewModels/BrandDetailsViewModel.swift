////
//BrandDetailsViewModel.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

class BrandDetailsViewModel: ObservableObject {
    @Published var products: [BrandDetailsData] = []
    
    @Published var errorMessage: String?
    @Published var displayErrorAlert: Bool = false
    
    @Published var isLoading: Bool = false
    private var newPageURL: String?
    private var hasNextPage: Bool = true
    
    private let fetchBrandDetailsUseCase: FetchBrandDetailsUseCase
    
    init(fetchBrandDetailsUseCase: FetchBrandDetailsUseCase) {
        self.fetchBrandDetailsUseCase = fetchBrandDetailsUseCase
    }
    
    @MainActor
    func loadBrandProducts() async {
        guard !isLoading, hasNextPage else { return }
        
        isLoading = true
        
        Task { [weak self] in
            
            guard let self = self else { return }
            
            do {
                
                let (newProducts, hasNextPage, newPageURL) = try await fetchBrandDetailsUseCase.execute(pageURL: newPageURL)
                
                self.products.append(contentsOf: newProducts)
                self.hasNextPage = hasNextPage
                self.newPageURL = newPageURL
                
                self.isLoading = false
                
            } catch {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                self.displayErrorAlert = true
            }
        }
    }
    
    @MainActor
    func loadNextPage(currentPeoduct: BrandDetailsData) async {
        if let lastProduct = products.last, lastProduct.id == currentPeoduct.id {
            if hasNextPage {
                await loadBrandProducts()
            }
        }
    }
    
    @MainActor
    func pullToRefresh() async {
        products.removeAll()
        errorMessage = nil
        displayErrorAlert = false
        
        await loadBrandProducts()
    }
}
