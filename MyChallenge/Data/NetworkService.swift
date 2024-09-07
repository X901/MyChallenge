////
//NetworkService.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchBrandProducts(pageURL: String?) async throws -> BrandDetails
    func fetchProductDetails(id: String) async throws -> ProductDetails
}

class NetworkService: NetworkServiceProtocol {

    private let session: URLSession
    private let configRepository: DeveloperAppConfigRepository

    init(session: URLSession = .shared, configRepository: DeveloperAppConfigRepository) {
        self.session = session
        self.configRepository = configRepository
    }

    func fetchBrandProducts(pageURL: String? = nil) async throws -> BrandDetails {
        let config = try configRepository.fetchAppConfig()
        let storeIdentifier = String(config.id)

        let urlString = pageURL ?? "https://api.salla.dev/store/v1/brands/1724782240?page=1&per_page=10"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(storeIdentifier, forHTTPHeaderField: "Store-Identifier")
        request.setValue("SAR", forHTTPHeaderField: "Currency")
        request.setValue("3.0.0", forHTTPHeaderField: "AppVersion")

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if httpResponse.statusCode == 200 {
            return try JSONDecoder().decode(BrandDetails.self, from: data)
        } else {
  
            let serverError = try JSONDecoder().decode(CustomErrorServer.self, from: data)
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [
                NSLocalizedDescriptionKey: serverError.error?.message ?? ""
            ])

        }
        
    }
    
    func fetchProductDetails(id: String) async throws -> ProductDetails {
        let config = try configRepository.fetchAppConfig()
        let storeIdentifier = String(config.id)

        let urlString = "https://api.salla.dev/store/v1/products/\(id)/details"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(storeIdentifier, forHTTPHeaderField: "Store-Identifier")
        request.setValue("SAR", forHTTPHeaderField: "Currency")
        request.setValue("3.0.0", forHTTPHeaderField: "AppVersion")

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        if httpResponse.statusCode == 200 {
            return try JSONDecoder().decode(ProductDetails.self, from: data)
        } else {
  
            let serverError = try JSONDecoder().decode(CustomErrorServer.self, from: data)
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [
                NSLocalizedDescriptionKey: serverError.error?.message ?? ""
            ])
            

        }

    }
}
