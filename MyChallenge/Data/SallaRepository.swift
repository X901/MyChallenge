////
//SallaRepository.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

protocol SallaRepository {
    func fetchBrandProducts(pageURL: String?) async throws -> BrandDetails
    func fetchProductDetails(id: String) async throws -> ProductDetails

}

class SallaRepositoryIml: SallaRepository {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchBrandProducts(pageURL: String?) async throws -> BrandDetails {
        return try await networkService.fetchBrandProducts(pageURL: pageURL)
    }
    
    func fetchProductDetails(id: String) async throws -> ProductDetails {
        return try await networkService.fetchProductDetails(id: id)
    }
    
}
