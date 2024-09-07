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

class SallaRepositoryImpl: SallaRepository {
    private let networkService: NetworkServiceProtocol
    private let realmRepository: RealmRepository
    
    init(networkService: NetworkServiceProtocol, realmRepository: RealmRepository) {
        self.networkService = networkService
        self.realmRepository = realmRepository
    }
    
    func fetchBrandProducts(pageURL: String?) async throws -> BrandDetails {
        do {
            let brandDetails = try await networkService.fetchBrandProducts(pageURL: pageURL)
            try await realmRepository.save(brandDetails)
            return brandDetails
        } catch {
            if let cachedBrandDetails = try await realmRepository.fetchBrandDetails() {
                return cachedBrandDetails
            }
            throw error
        }
    }
    
    func fetchProductDetails(id: String) async throws -> ProductDetails {
        do {
            let productDetails = try await networkService.fetchProductDetails(id: id)
            try await realmRepository.save(productDetails)
            return productDetails
        } catch {
            if let cachedProductDetails = try await realmRepository.fetchProductDetails(id: id) {
                return cachedProductDetails
            }
            throw error
        }
    }
}

