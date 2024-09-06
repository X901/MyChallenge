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
}

class SallaRepositoryIml: SallaRepository {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchBrandProducts(pageURL: String?) async throws -> BrandDetails {
        return try await networkService.fetchBrandProduct(pageURL: pageURL)
    }
    
}
