////
//MockSallaRepository.swift
//MyChallengeTests
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation
@testable import MyChallenge

class MockSallaRepository: SallaRepository {

    var productsToReturn: [BrandDetailsData] = []
    var nextPageURLToReturn: String? = nil

    func fetchBrandProducts(pageURL: String?) async throws -> BrandDetails {
        return BrandDetails(
            status: 200,
            success: true,
            data: productsToReturn,
            cursor: Cursor(current: "currentPageURL", next: nextPageURLToReturn)
        )
    }
    
    var productDetailsToReturn: ProductDetails?

     func fetchProductDetails(id: String) async throws -> ProductDetails {
         if let productDetails = productDetailsToReturn {
             return productDetails
         } else {
             throw NSError(domain: "No product found", code: 404, userInfo: nil)
         }
     }
}
