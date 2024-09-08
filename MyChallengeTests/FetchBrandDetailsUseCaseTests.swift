////
//MyChallengeTests.swift
//MyChallengeTests
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import XCTest
@testable import MyChallenge


class FetchBrandDetailsUseCaseTests: XCTestCase {
    
    var mockRepository: MockSallaRepository!
    var useCase: FetchBrandDetailsUseCase!

    override func setUp() {
        super.setUp()
        mockRepository = MockSallaRepository()
        useCase = FetchBrandDetailsUseCase(repository: mockRepository)
    }

    override func tearDown() {
        useCase = nil
        super.tearDown()
    }

    func testExecute_ReturnsCorrectData_WhenSuccess() async throws {
        // Arrange: Set up mock data
        let mockProduct = BrandDetailsData(
            id: "1",
            name: "Mock Product",
            subtitle: "",
            description: nil,
            url: nil,
            promotionTitle: "Promotion",
            type: nil,
            status: nil,
            calories: nil,
            soldQuantity: nil,
            isTaxable: true,
            category: nil,
            image: ImageObject(url: "http://example.com"),
            brand: nil,
            tags: [],
            isOnSale: false,
            isAvailable: true,
            isOutOfStock: false,
            isRequireShipping: true,
            regularPrice: 100.0,
            price: 80.0,
            salePrice: nil,
            startingPrice: nil,
            currency: "SAR",
            hasOptions: false,
            pinned: false,
            sku: nil
        )
        mockRepository.productsToReturn = [mockProduct]
        mockRepository.nextPageURLToReturn = "nextPageURL"

        // Act: Call the execute function
        let result = try await useCase.execute(pageURL: "nil")

        // Assert: Check if the result matches the mock data
        XCTAssertEqual(result.products.count, 1)
        XCTAssertEqual(result.products.first?.id, "1")
        XCTAssertEqual(result.products.first?.name, "Mock Product")
        XCTAssertEqual(result.hasNextPage, true)
        XCTAssertEqual(result.nextPageURL, "nextPageURL")
    }
    
}
