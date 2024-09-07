////
//FetchProductDetailsUseCase.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

class FetchProductDetailsUseCase {
    private let repository: SallaRepository
    
    init(repository: SallaRepository) {
        self.repository = repository
    }
    
    func execute(id: String) async throws -> ProductDetails {
        let productDetails = try await repository.fetchProductDetails(id: id)
  
            return productDetails

    }
}
