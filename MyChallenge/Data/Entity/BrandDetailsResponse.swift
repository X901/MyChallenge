////
//BrandDetailsResponse.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

// MARK: - BrandDetailsResponse
struct BrandDetailsResponse: Codable {
    let status: Int
    let success: Bool
    let data: [BrandDetailsData]
    let cursor: Cursor

    enum CodingKeys: String, CodingKey {
        case status
        case success
        case data
        case cursor
    }
}

// MARK: - Cursor
struct Cursor: Codable {
    let current: String
    let next: String

    enum CodingKeys: String, CodingKey {
        case current
        case next
    }
}

// MARK: - Datum
struct BrandDetailsData: Codable {
    let id: String
    let name: String
    let description: String?
    let url: String
    let promotionTitle: String
    let type: String
    let status: String
    let calories: Int?
    let soldQuantity: Int?
    let isTaxable: Bool
    let category: Category
    let image: ImageObject
    let brand: Brand
    let tags: [Category]
    let isOnSale: Bool
    let isAvailable: Bool
    let isOutOfStock: Bool
    let isRequireShipping: Bool
    let regularPrice: Int
    let price: Int
    let salePrice: Int
    let startingPrice: Int
    let currency: String
    let hasOptions: Bool
    let pinned: Bool
    let sku: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case url
        case promotionTitle
        case type
        case status
        case calories
        case soldQuantity
        case isTaxable
        case category
        case image
        case brand
        case tags
        case isOnSale
        case isAvailable
        case isOutOfStock
        case isRequireShipping
        case regularPrice
        case price
        case salePrice
        case startingPrice
        case currency
        case hasOptions
        case pinned
        case sku
    }
}

// MARK: - Brand
struct Brand: Codable {
    let id: String
    let url: String?
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

// MARK: - Image
struct ImageObject: Codable {
    let url: String

    enum CodingKeys: String, CodingKey {
        case url
    }
}
