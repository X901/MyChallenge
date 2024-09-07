////
//FetchProductDetailsUseCaseTests.swift
//MyChallengeTests
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import XCTest
@testable import MyChallenge

class FetchProductDetailsUseCaseTests: XCTestCase {
    
    var mockRepository: MockSallaRepository!
    var useCase: FetchProductDetailsUseCase!

    override func setUp() {
        super.setUp()
        mockRepository = MockSallaRepository()
        useCase = FetchProductDetailsUseCase(repository: mockRepository)
    }

    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }

    func testExecute_ReturnsCorrectProductDetails_WhenSuccess() async throws {
        let mockProductDetails = ProductDetails(
            status: 200,
            success: true,
            data: ProductDetailsData(
                id: 1,
                name: "Test Product",
                description: "A test product description",
                url: "http://example.com/product",
                promotionTitle: "Promo",
                subtitle: "Subtitle",
                type: "physical",
                status: "available",
                price: 99.99,
                baseCurrencyPrice: BaseCurrencyPrice(currency: "SAR", amount: 99.99),
                salePrice: 79.99,
                regularPrice: 99.99,
                startingPrice: nil,
                quantity: 10,
                maxQuantity: 100,
                isTaxable: true,
                hasReadMore: false,
                isOnSale: false,
                isAvailable: true,
                isOutOfStock: false,
                isRequireShipping: true,
                image: ImageProduct(url: "http://example.com/image.jpg", alt: "Product Image"),
                currency: "SAR",
                sku: nil,
                discountEnds: nil,
                canAddNote: false,
                canShowRemainedQuantity: false,
                canUploadFile: false,
                hasCustomForm: false,
                hasMetadata: false,
                isHiddenQuantity: false,
                weight: "1kg",
                calories: nil
            )
        )
        mockRepository.productDetailsToReturn = mockProductDetails

        let result = try await useCase.execute(id: "1")

        XCTAssertEqual(result.data.id, 1)
        XCTAssertEqual(result.data.name, "Test Product")
        XCTAssertEqual(result.data.price, 99.99)
    }
    
}

