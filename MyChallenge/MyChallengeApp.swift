////
//MyChallengeApp.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import SwiftUI
import NavigationBackport

@main
struct MyChallengeApp: App {
    @State private var path = NBNavigationPath()
    
    var body: some Scene {
        WindowGroup {

            NBNavigationStack(path: $path) {
            BrandDetailsView(
                onProductSelected: { productId in
                    path.append(productId)
                }
            )
            .nbNavigationDestination(for: String.self) { productId in
                ProductDetailsView(
                    id: productId,
                    onBack: {
                        path.removeLast()
                    }
                )
            }
            }

        }
    }
}
