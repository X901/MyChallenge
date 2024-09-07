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

        container.register(FetchBrandDetailsUseCase.self) { r in
            FetchBrandDetailsUseCase(repository: r.resolve(SallaRepository.self)!)
        }
        
        container.register(FetchProductDetailsUseCase.self) { r in
            FetchProductDetailsUseCase(repository: r.resolve(SallaRepository.self)!)
        }

        container.register(BrandDetailsViewModel.self) { r in
            BrandDetailsViewModel(fetchBrandDetailsUseCase: r.resolve(FetchBrandDetailsUseCase.self)!)
        }
        
        container.register(ProductDetailsViewModel.self) { r in
            ProductDetailsViewModel(fetchProductDetailsUseCase: r.resolve(FetchProductDetailsUseCase.self)!)
        }

    }
}



