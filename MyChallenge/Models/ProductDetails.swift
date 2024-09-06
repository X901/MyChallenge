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
        case status = "status"
        case success = "success"
        case data = "data"
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
        case id = "id"
        case name = "name"
        case description = "description"
        case url = "url"
        case promotionTitle = "promotion_title"
        case subtitle = "subtitle"
        case type = "type"
        case status = "status"
        case price = "price"
        case baseCurrencyPrice = "base_currency_price"
        case salePrice = "sale_price"
        case regularPrice = "regular_price"
        case startingPrice = "starting_price"
        case quantity = "quantity"
        case maxQuantity = "max_quantity"
        case isTaxable = "is_taxable"
        case hasReadMore = "has_read_more"
        case isOnSale = "is_on_sale"
        case isAvailable = "is_available"
        case isOutOfStock = "is_out_of_stock"
        case isRequireShipping = "is_require_shipping"
        case image = "image"
        case currency = "currency"
    }
}

// MARK: - BaseCurrencyPrice
struct BaseCurrencyPrice: Codable {
    let currency: String
    let amount: Int

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case amount = "amount"
    }
}

// MARK: - Image
struct ImageProduct: Codable {
    let url: String
    let alt: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case alt = "alt"
    }
}
