////
//RealmProductDetails.swift
//MyChallenge
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation
import RealmSwift

class RealmProductDetails: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String?
    @Persisted var descriptionText: String?
    @Persisted var url: String?
    @Persisted var promotionTitle: String?
    @Persisted var subtitle: String?
    @Persisted var type: String?
    @Persisted var status: String?
    @Persisted var price: Double?
    @Persisted var salePrice: Double?
    @Persisted var regularPrice: Double?
    @Persisted var startingPrice: Double?
    @Persisted var quantity: Int?
    @Persisted var maxQuantity: Int?
    @Persisted var isTaxable: Bool = false
    @Persisted var hasReadMore: Bool = false
    @Persisted var isOnSale: Bool = false
    @Persisted var isAvailable: Bool = false
    @Persisted var isOutOfStock: Bool = false
    @Persisted var isRequireShipping: Bool = false
    @Persisted var imageUrl: String?
    @Persisted var imageAlt: String?
    @Persisted var currency: String?
    @Persisted var sku: String?
    @Persisted var discountEnds: String?
    @Persisted var canAddNote: Bool = false
    @Persisted var canShowRemainedQuantity: Bool = false
    @Persisted var canUploadFile: Bool = false
    @Persisted var hasCustomForm: Bool = false
    @Persisted var hasMetadata: Bool = false
    @Persisted var isHiddenQuantity: Bool = false
    @Persisted var weight: String?
    @Persisted var calories: String?
}
