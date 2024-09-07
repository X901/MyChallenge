////
//RealmRepository.swift
//MyChallenge
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmRepository {
    func save(_ brandDetails: BrandDetails) async throws
    func fetchBrandDetails() async throws -> BrandDetails?
    func save(_ productDetails: ProductDetails) async throws
    func fetchProductDetails(id: String) async throws -> ProductDetails?
}

class RealmRepositoryImpl: RealmRepository {
    private let configuration: Realm.Configuration
        
        init() {
            configuration = Realm.Configuration(
                schemaVersion: 1,
                migrationBlock: { migration, oldSchemaVersion in
                }
            )
        }
        
        private func getRealm() throws -> Realm {
            return try Realm(configuration: configuration)
        }
    
    @MainActor
    func save(_ brandDetails: BrandDetails) async throws {
        let realm = try getRealm()

        let realmBrandDetails = RealmBrandDetails()
        realmBrandDetails.currentPage = brandDetails.cursor.current
        realmBrandDetails.nextPage = brandDetails.cursor.next
        
        for product in brandDetails.data {
            let realmProduct = RealmBrandDetailsData()
            realmProduct.id = product.id
            realmProduct.name = product.name
            realmProduct.descriptionText = product.description
            realmProduct.url = product.url
            realmProduct.promotionTitle = product.promotionTitle
            realmProduct.type = product.type
            realmProduct.status = product.status
            realmProduct.calories = product.calories
            realmProduct.soldQuantity = product.soldQuantity
            realmProduct.isTaxable = product.isTaxable
            realmProduct.imageUrl = product.image.url
            realmProduct.isOnSale = product.isOnSale
            realmProduct.isAvailable = product.isAvailable
            realmProduct.isOutOfStock = product.isOutOfStock
            realmProduct.isRequireShipping = product.isRequireShipping
            realmProduct.regularPrice = product.regularPrice
            realmProduct.price = product.price
            realmProduct.salePrice = product.salePrice
            realmProduct.startingPrice = product.startingPrice
            realmProduct.currency = product.currency
            realmProduct.hasOptions = product.hasOptions
            realmProduct.pinned = product.pinned
            realmProduct.sku = product.sku
            
            realmBrandDetails.products.append(realmProduct)
        }
        
        try await realm.asyncWrite {
            realm.add(realmBrandDetails, update: .modified)
        }
    }
    
    @MainActor
    func fetchBrandDetails() async throws -> BrandDetails? {
        let realm = try getRealm()

        let realmBrandDetails = realm.objects(RealmBrandDetails.self).first
        
        guard let realmBrandDetails = realmBrandDetails else {
            return nil
        }
        
        let products = realmBrandDetails.products.map { realmProduct -> BrandDetailsData in
            return BrandDetailsData(
                id: realmProduct.id,
                name: realmProduct.name,
                description: realmProduct.description,
                url: realmProduct.url,
                promotionTitle: realmProduct.promotionTitle,
                type: realmProduct.type,
                status: realmProduct.status,
                calories: realmProduct.calories,
                soldQuantity: realmProduct.soldQuantity,
                isTaxable: realmProduct.isTaxable,
                category: nil,
                image: ImageObject(url: realmProduct.imageUrl),
                brand: nil,
                tags: [],
                isOnSale: realmProduct.isOnSale,
                isAvailable: realmProduct.isAvailable,
                isOutOfStock: realmProduct.isOutOfStock,
                isRequireShipping: realmProduct.isRequireShipping,
                regularPrice: realmProduct.regularPrice,
                price: realmProduct.price,
                salePrice: realmProduct.salePrice,
                startingPrice: realmProduct.startingPrice,
                currency: realmProduct.currency,
                hasOptions: realmProduct.hasOptions,
                pinned: realmProduct.pinned,
                sku: realmProduct.sku
            )
        }
        
        return BrandDetails(
            status: 200,
            success: true,
            data: Array(products),
            cursor: Cursor(current: realmBrandDetails.currentPage ?? "", next: realmBrandDetails.nextPage)
        )
    }
    
    @MainActor
    func save(_ productDetails: ProductDetails) async throws {
        let realm = try getRealm()

        let realmProductDetails = RealmProductDetails()
        realmProductDetails.id = String(productDetails.data.id)
        realmProductDetails.name = productDetails.data.name
        realmProductDetails.descriptionText = productDetails.data.description
        realmProductDetails.url = productDetails.data.url
        realmProductDetails.promotionTitle = productDetails.data.promotionTitle
        realmProductDetails.subtitle = productDetails.data.subtitle
        realmProductDetails.type = productDetails.data.type
        realmProductDetails.status = productDetails.data.status
        realmProductDetails.price = productDetails.data.price
        realmProductDetails.salePrice = productDetails.data.salePrice
        realmProductDetails.regularPrice = productDetails.data.regularPrice
        realmProductDetails.startingPrice = productDetails.data.startingPrice
        realmProductDetails.quantity = productDetails.data.quantity
        realmProductDetails.maxQuantity = productDetails.data.maxQuantity
        realmProductDetails.isTaxable = productDetails.data.isTaxable ?? false
        realmProductDetails.hasReadMore = productDetails.data.hasReadMore ?? false
        realmProductDetails.isOnSale = productDetails.data.isOnSale ?? false
        realmProductDetails.isAvailable = productDetails.data.isAvailable ?? false
        realmProductDetails.isOutOfStock = productDetails.data.isOutOfStock ?? false
        realmProductDetails.isRequireShipping = productDetails.data.isRequireShipping ?? false
        realmProductDetails.imageUrl = productDetails.data.image.url
        realmProductDetails.imageAlt = productDetails.data.image.alt
        realmProductDetails.currency = productDetails.data.currency
        realmProductDetails.sku = productDetails.data.sku
        realmProductDetails.discountEnds = productDetails.data.discountEnds
        realmProductDetails.canAddNote = productDetails.data.canAddNote ?? false
        realmProductDetails.canShowRemainedQuantity = productDetails.data.canShowRemainedQuantity ?? false
        realmProductDetails.canUploadFile = productDetails.data.canUploadFile ?? false
        realmProductDetails.hasCustomForm = productDetails.data.hasCustomForm ?? false
        realmProductDetails.hasMetadata = productDetails.data.hasMetadata ?? false
        realmProductDetails.isHiddenQuantity = productDetails.data.isHiddenQuantity ?? false
        realmProductDetails.weight = productDetails.data.weight
        realmProductDetails.calories = productDetails.data.calories

        try await realm.asyncWrite {
            realm.add(realmProductDetails, update: .modified)
        }
    }

    @MainActor
    func fetchProductDetails(id: String) async throws -> ProductDetails? {
        let realm = try getRealm()

        guard let realmProductDetails = realm.object(ofType: RealmProductDetails.self, forPrimaryKey: id) else {
            return nil
        }

        let productDetailsData = ProductDetailsData(
            id: Int(realmProductDetails.id) ?? 0,
            name: realmProductDetails.name,
            description: realmProductDetails.description,
            url: realmProductDetails.url,
            promotionTitle: realmProductDetails.promotionTitle,
            subtitle: realmProductDetails.subtitle,
            type: realmProductDetails.type,
            status: realmProductDetails.status,
            price: realmProductDetails.price,
            baseCurrencyPrice: BaseCurrencyPrice(currency: realmProductDetails.currency, amount: realmProductDetails.price),
            salePrice: realmProductDetails.salePrice,
            regularPrice: realmProductDetails.regularPrice,
            startingPrice: realmProductDetails.startingPrice,
            quantity: realmProductDetails.quantity,
            maxQuantity: realmProductDetails.maxQuantity,
            isTaxable: realmProductDetails.isTaxable,
            hasReadMore: realmProductDetails.hasReadMore,
            isOnSale: realmProductDetails.isOnSale,
            isAvailable: realmProductDetails.isAvailable,
            isOutOfStock: realmProductDetails.isOutOfStock,
            isRequireShipping: realmProductDetails.isRequireShipping,
            image: ImageProduct(url: realmProductDetails.imageUrl, alt: realmProductDetails.imageAlt),
            currency: realmProductDetails.currency,
            sku: realmProductDetails.sku,
            discountEnds: realmProductDetails.discountEnds,
            canAddNote: realmProductDetails.canAddNote,
            canShowRemainedQuantity: realmProductDetails.canShowRemainedQuantity,
            canUploadFile: realmProductDetails.canUploadFile,
            hasCustomForm: realmProductDetails.hasCustomForm,
            hasMetadata: realmProductDetails.hasMetadata,
            isHiddenQuantity: realmProductDetails.isHiddenQuantity,
            weight: realmProductDetails.weight,
            calories: realmProductDetails.calories
        )

        return ProductDetails(status: 200, success: true, data: productDetailsData)
    }
}
