////
//Font+Modifier.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct EstedadMediumModifier: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Estedad-Medium", size: size))
    }
}

struct DINNextLTArabicModifier: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("DINNextLTArabic-Regular", size: size))
    }
}

extension View {
    func medium(size: CGFloat = 20) -> some View {
        self.modifier(EstedadMediumModifier(size: size))
    }
    
    func regular(size: CGFloat = 20) -> some View {
        self.modifier(DINNextLTArabicModifier(size: size))
    }
}
