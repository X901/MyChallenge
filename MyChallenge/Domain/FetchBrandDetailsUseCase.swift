////
//FetchBrandDetailsUseCase.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

class FetchBrandDetailsUseCase {
    private let repository: SallaRepository
    
    init(repository: SallaRepository) {
        self.repository = repository
    }
    
    func execute(pageURL: String?) async throws -> (products: [BrandDetailsData], hasNextPage: Bool, nextPageURL: String?) {
        let brandDetails = try await repository.fetchBrandProducts(pageURL: pageURL)
        
        let products = brandDetails.data
        let hasNextPage = brandDetails.cursor.next != nil
        let nextPageURL = brandDetails.cursor.next
        return (products, hasNextPage, nextPageURL)
    }
}
