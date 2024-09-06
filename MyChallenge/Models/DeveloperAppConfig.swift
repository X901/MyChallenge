////
//DeveloperAppConfig.swift
//MyChallenge
//
//Created by Basel Baragabah on 06/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

struct DeveloperAppConfig: Codable {
    let id: Int
    let store: String
    let appColor: Int
    let fontFamily: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case store = "store"
        case appColor = "app_color"
        case fontFamily = "font_family"
    }
}
