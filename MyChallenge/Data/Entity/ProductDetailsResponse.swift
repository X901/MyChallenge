////
//ProductDetailsResponse.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

// MARK: - ProductDetailsResponse
struct ProductDetailsResponse: Codable {
    let status: Int
    let success: Bool
    let data: ProductDetails

    enum CodingKeys: String, CodingKey {
        case status
        case success
        case data
    }
}

// MARK: - DataClass
struct ProductDetails: Codable {
    let id: Int
    let name: String
    let description: String
    let url: String
    let promotionTitle: String
    let subtitle: String
    let type: String
    let status: String
    let price: Int
    let baseCurrencyPrice: BaseCurrencyPrice
    let salePrice: Int
    let regularPrice: Int
    let startingPrice: Int
    let quantity: Int
    let maxQuantity: Int
    let isTaxable: Bool
    let hasReadMore: Bool
    let isOnSale: Bool
    let isAvailable: Bool
    let isOutOfStock: Bool
    let isRequireShipping: Bool
    let image: ImageProduct
    let currency: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case url
        case promotionTitle
        case subtitle
        case type
        case status
        case price
        case baseCurrencyPrice
        case salePrice
        case regularPrice
        case startingPrice
        case quantity
        case maxQuantity
        case isTaxable
        case hasReadMore
        case isOnSale
        case isAvailable
        case isOutOfStock
        case isRequireShipping
        case image
        case currency
    }
}

// MARK: - BaseCurrencyPrice
struct BaseCurrencyPrice: Codable {
    let currency: String
    let amount: Int

    enum CodingKeys: String, CodingKey {
        case currency
        case amount
    }
}

// MARK: - Image
struct ImageProduct: Codable {
    let url: String
    let alt: String

    enum CodingKeys: String, CodingKey {
        case url
        case alt
    }
}
