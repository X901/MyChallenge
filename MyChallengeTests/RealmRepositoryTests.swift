////
//RealmRepositoryTests.swift
//MyChallengeTests
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import XCTest
import RealmSwift
@testable import MyChallenge

class RealmRepositoryTests: XCTestCase {
    var realmRepositoryImpl: RealmRepositoryImpl!
      
      override func setUpWithError() throws {
          try super.setUpWithError()
          
          let configuration = Realm.Configuration(
              inMemoryIdentifier: "TestRealm"
          )
          
          class TestRealmRepositoryImpl: RealmRepositoryImpl {
              let testConfiguration: Realm.Configuration
              
              init(testConfiguration: Realm.Configuration) {
                  self.testConfiguration = testConfiguration
                  super.init()
              }
              
               private func getRealm() throws -> Realm {
                  return try Realm(configuration: testConfiguration)
              }
          }
          
          realmRepositoryImpl = TestRealmRepositoryImpl(testConfiguration: configuration)
      }

      override func tearDownWithError() throws {
          realmRepositoryImpl = nil
          try super.tearDownWithError()
      }

    @MainActor
    func testSaveAndFetchBrandDetails() async throws {
        let brandDetails = BrandDetails(
            status: 200,
            success: true,
            data: [
                BrandDetailsData(id: "1", name: "Test Brand", description: "Test Description", url: "https://test.com", promotionTitle: "Test Promo", type: "Test Type", status: "active", calories: 100, soldQuantity: 50, isTaxable: true, category: nil, image: ImageObject(url: "https://test.com/image.jpg"), brand: nil, tags: [], isOnSale: false, isAvailable: true, isOutOfStock: false, isRequireShipping: true, regularPrice: 100.0, price: 90.0, salePrice: nil, startingPrice: nil, currency: "USD", hasOptions: false, pinned: false, sku: "TEST123")
            ],
            cursor: Cursor(current: "1", next: "2")
        )

        try await realmRepositoryImpl.save(brandDetails)
        let fetchedBrandDetails = try await realmRepositoryImpl.fetchBrandDetails()

        XCTAssertNotNil(fetchedBrandDetails)
        XCTAssertEqual(fetchedBrandDetails?.data.count, 1)
        XCTAssertEqual(fetchedBrandDetails?.data.first?.id, "1")
        XCTAssertEqual(fetchedBrandDetails?.data.first?.name, "Test Brand")
        XCTAssertEqual(fetchedBrandDetails?.cursor.current, "1")
        XCTAssertEqual(fetchedBrandDetails?.cursor.next, "2")
    }

    @MainActor
    func testSaveAndFetchProductDetails() async throws {

        let productId = "1"
        let productDetails = ProductDetails(
            status: 200,
            success: true,
            data: ProductDetailsData(
                id: 1,
                name: "Test Product",
                description: "Test Description",
                url: "https://test.com",
                promotionTitle: "Test Promo",
                subtitle: "Test Subtitle",
                type: "Test Type",
                status: "active",
                price: 100.0,
                baseCurrencyPrice: BaseCurrencyPrice(currency: "USD", amount: 100.0),
                salePrice: 90.0,
                regularPrice: 100.0,
                startingPrice: nil,
                quantity: 50,
                maxQuantity: 100,
                isTaxable: true,
                hasReadMore: false,
                isOnSale: true,
                isAvailable: true,
                isOutOfStock: false,
                isRequireShipping: true,
                image: ImageProduct(url: "https://test.com/image.jpg", alt: "Test Image"),
                currency: "USD",
                sku: "TEST123",
                discountEnds: nil,
                canAddNote: false,
                canShowRemainedQuantity: true,
                canUploadFile: false,
                hasCustomForm: false,
                hasMetadata: false,
                isHiddenQuantity: false,
                weight: "1kg",
                calories: "100"
            )
        )

        try await realmRepositoryImpl.save(productDetails)
        let fetchedProductDetails = try await realmRepositoryImpl.fetchProductDetails(id: productId)

        XCTAssertNotNil(fetchedProductDetails)
        XCTAssertEqual(fetchedProductDetails?.data.id, 1)
        XCTAssertEqual(fetchedProductDetails?.data.name, "Test Product")
        XCTAssertEqual(fetchedProductDetails?.data.price, 100.0)
    }
}
