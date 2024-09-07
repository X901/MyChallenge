////
//BrandDetailsResponse.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

// MARK: - BrandDetails
struct BrandDetails: Codable {
    let status: Int
    let success: Bool
    let data: [BrandDetailsData]
    let cursor: Cursor

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case data = "data"
        case cursor = "cursor"
    }
}

// MARK: - Cursor
struct Cursor: Codable {
    let current: String
    let next: String?

    init(current: String, next: String?) {
           self.current = current
           self.next = next
       }
    
    enum CodingKeys: String, CodingKey {
        case current = "current"
        case next = "next"
    }
    
    // I notice `current` sometime it's (Int) other time is (String)
    // This code check try to decode as String, if it can't decode it will try Int then Double after that converted it to String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if let currentString = try? container.decode(String.self, forKey: .current) {
            self.current = currentString
        } else if let currentNumber = try? container.decode(Int.self, forKey: .current) {
            self.current = String(currentNumber)
        } else if let currentDouble = try? container.decode(Double.self, forKey: .current) {
            self.current = String(currentDouble)
        } else {
            throw DecodingError.typeMismatch(String.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Expected a String or Number for 'current' field"))
        }

        self.next = try container.decodeIfPresent(String.self, forKey: .next)
    }
}

// MARK: - Datum
struct BrandDetailsData: Codable {
    let id: String
    let name: String?
    let description: String?
    let url: String?
    let promotionTitle: String
    let type: String?
    let status: String?
    let calories: Int?
    let soldQuantity: Int?
    let isTaxable: Bool
    let category: Category?
    let image: ImageObject
    let brand: Brand?
    let tags: [Category]
    let isOnSale: Bool
    let isAvailable: Bool
    let isOutOfStock: Bool
    let isRequireShipping: Bool
    let regularPrice: Double?
    let price: Double?
    let salePrice: Double?
    let startingPrice: Double?
    let currency: String?
    let hasOptions: Bool
    let pinned: Bool
    let sku: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case url = "url"
        case promotionTitle = "promotion_title"
        case type = "type"
        case status = "status"
        case calories = "calories"
        case soldQuantity = "sold_quantity"
        case isTaxable = "is_taxable"
        case category = "category"
        case image = "image"
        case brand = "brand"
        case tags = "tags"
        case isOnSale = "is_on_sale"
        case isAvailable = "is_available"
        case isOutOfStock = "is_out_of_stock"
        case isRequireShipping = "is_require_shipping"
        case regularPrice = "regular_price"
        case price = "price"
        case salePrice = "sale_price"
        case startingPrice = "starting_price"
        case currency = "currency"
        case hasOptions = "has_options"
        case pinned = "pinned"
        case sku = "sku"
    }
}

// MARK: - Brand
struct Brand: Codable {
    let id: String?
    let url: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case name = "name"
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

// MARK: - Image
struct ImageObject: Codable {
    let url: String?

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}
