////
//Color+Ext.swift
//MyChallenge
//
//Created by Basel Baragabah on 06/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

// Color in json file is Int, Convert it to SwiftUI Color
extension Int {
    func colorFromARGB() -> Color {
        let alpha = Double((self >> 24) & 0xFF) / 255.0
        let red = Double((self >> 16) & 0xFF) / 255.0
        let green = Double((self >> 8) & 0xFF) / 255.0
        let blue = Double(self & 0xFF) / 255.0
        
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
