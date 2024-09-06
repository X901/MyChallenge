////
//AppContainer.swift
//MyChallenge
//
//Created by Basel Baragabah on 05/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation
import Swinject

class AppContainer {
    static let shared = AppContainer()

    let container: Container

    private init() {
        container = Container()

        container.register(DeveloperAppConfigRepository.self) { _ in
                  LocalAppConfigRepository()
              }
        container.register(NetworkServiceProtocol.self) { r in
            let configRepository = r.resolve(DeveloperAppConfigRepository.self)!
            return NetworkService(configRepository: configRepository)
        }

        container.register(SallaRepository.self) { r in
            SallaRepositoryIml(networkService: r.resolve(NetworkServiceProtocol.self)!)
        }

        // Register Use Case
        container.register(FetchBrandDetailsUseCase.self) { r in
            FetchBrandDetailsUseCase(repository: r.resolve(SallaRepository.self)!)
        }

        // Keep the ViewModel registration synchronous
        container.register(BrandDetailsViewModel.self) { r in
            BrandDetailsViewModel(fetchBrandDetailsUseCase: r.resolve(FetchBrandDetailsUseCase.self)!)
        }
    }
}



