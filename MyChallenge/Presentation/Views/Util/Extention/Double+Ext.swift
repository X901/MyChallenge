////
//Double+Ext.swift
//MyChallenge
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

extension Double {
    func priceWithTwoDecimal() -> String {
        return String(format: "%.2f", self)
    }
}

