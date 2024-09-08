////
//RealmBrandDetails.swift
//MyChallenge
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation
import RealmSwift

class RealmBrandDetails: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var products: List<RealmBrandDetailsData>
    @Persisted var currentPage: String?
    @Persisted var nextPage: String?
}

class RealmBrandDetailsData: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String?
    @Persisted var subtitle: String?
    @Persisted var descriptionText: String?
    @Persisted var url: String?
    @Persisted var promotionTitle: String = ""
    @Persisted var type: String?
    @Persisted var status: String?
    @Persisted var calories: Int?
    @Persisted var soldQuantity: Int?
    @Persisted var isTaxable: Bool = false
    @Persisted var imageUrl: String?
    @Persisted var isOnSale: Bool = false
    @Persisted var isAvailable: Bool = false
    @Persisted var isOutOfStock: Bool = false
    @Persisted var isRequireShipping: Bool = false
    @Persisted var regularPrice: Double?
    @Persisted var price: Double?
    @Persisted var salePrice: Double?
    @Persisted var startingPrice: Double?
    @Persisted var currency: String?
    @Persisted var hasOptions: Bool = false
    @Persisted var pinned: Bool = false
    @Persisted var sku: String?
}
