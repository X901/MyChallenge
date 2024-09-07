////
//ProductDetailsResponse.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

// MARK: - ProductDetailsResponse
struct ProductDetails: Codable {
    let status: Int
    let success: Bool
    let data: ProductDetailsData

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case data = "data"
    }
}

struct ProductDetailsData: Codable {
    let id: Int
    let name: String?
    let description: String?
    let url: String?
    let promotionTitle: String?
    let subtitle: String?
    let type: String?
    let status: String?
    let price: Double?
    let baseCurrencyPrice: BaseCurrencyPrice
    let salePrice: Double?
    let regularPrice: Double?
    let startingPrice: Double?
    let quantity: Int?
    let maxQuantity: Int?
    let isTaxable: Bool?
    let hasReadMore: Bool?
    let isOnSale: Bool?
    let isAvailable: Bool?
    let isOutOfStock: Bool?
    let isRequireShipping: Bool?
    let image: ImageProduct
    let currency: String?
    let sku: String?
    let discountEnds: String?
    let canAddNote: Bool?
    let canShowRemainedQuantity: Bool?
    let canUploadFile: Bool?
    let hasCustomForm: Bool?
    let hasMetadata: Bool?
    let isHiddenQuantity: Bool?
    let weight: String?
    let calories: String?

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
        case sku = "sku"
        case discountEnds = "discount_ends"
        case canAddNote = "can_add_note"
        case canShowRemainedQuantity = "can_show_remained_quantity"
        case canUploadFile = "can_upload_file"
        case hasCustomForm = "has_custom_form"
        case hasMetadata = "has_metadata"
        case isHiddenQuantity = "is_hidden_quantity"
        case weight = "weight"
        case calories = "calories"
    }
}

struct BaseCurrencyPrice: Codable {
    let currency: String?
    let amount: Double?

    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case amount = "amount"
    }
}

struct ImageProduct: Codable {
    let url: String?
    let alt: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case alt = "alt"
    }
}
