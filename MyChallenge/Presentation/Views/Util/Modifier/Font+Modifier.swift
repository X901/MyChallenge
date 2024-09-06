////
//Font+Modifier.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct DynamicFontModifier: ViewModifier {
    var size: CGFloat
    var fontFamily: String
    
    func body(content: Content) -> some View {
        let fontName: String
        
        switch fontFamily.lowercased() {
        case "dinnextltarabic-regular":
            fontName = "DINNextLTArabic-Regular"
        case "estedad-medium":
            fontName = "Estedad-Medium"
        default:
            fontName = "System"
        }
        
        return content.font(.custom(fontName, size: size))
    }
}

extension View {
    func applyDynamicFont(size: CGFloat = 20) -> some View {

        let fontFamily = UserDefaults.standard.string(forKey: "font_family") ?? "system"
        
        return self.modifier(DynamicFontModifier(size: size, fontFamily: fontFamily))
    }
}
