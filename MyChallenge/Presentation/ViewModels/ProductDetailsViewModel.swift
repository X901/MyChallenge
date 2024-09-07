////
//ProductDetailsViewModel.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

class ProductDetailsViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var displayErrorAlert: Bool = false

    @Published var product: ProductDetailsData?

    private let fetchProductDetailsUseCase: FetchProductDetailsUseCase
    
    init(fetchProductDetailsUseCase: FetchProductDetailsUseCase) {
        self.fetchProductDetailsUseCase = fetchProductDetailsUseCase
    }
    
    @MainActor
    func loadProductInformation(id: String) async {
        guard !isLoading else { return }
        
        isLoading = true
        
        Task { [weak self] in
            
            guard let self = self else { return }
            
            do {
                
                let productInfo = try await fetchProductDetailsUseCase.execute(id: id)
                
                self.product = productInfo.data
                
                self.isLoading = false
                
            } catch {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
                self.displayErrorAlert = true
            }
        }
    }
}
