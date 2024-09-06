////
//CornerRadius+Modifier.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI

struct CornerRadiusViewModifier: ViewModifier {
    let radius: Double

    func body(content: Content) -> some View {
        content.clipShape(.rect(cornerRadius: radius))
    }
}

extension View {
    func cornerRadius(_ radius: Double) -> some View {
        modifier(CornerRadiusViewModifier(radius: radius))
    }
}

extension View {
    func customCornerRadius(_ radius: Double) -> some View {
        clipShape(.rect(cornerRadius: radius))
    }
}
