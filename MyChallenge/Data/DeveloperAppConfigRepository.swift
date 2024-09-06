////
//DeveloperAppConfigRepository.swift
//MyChallenge
//
//Created by Basel Baragabah on 06/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

protocol DeveloperAppConfigRepository {
    func fetchAppConfig() throws -> DeveloperAppConfig
}

class LocalAppConfigRepository: DeveloperAppConfigRepository {
    func fetchAppConfig() throws -> DeveloperAppConfig {
        guard let url = Bundle.main.url(forResource: "Developers", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        
        let data = try Data(contentsOf: url)
        let config = try JSONDecoder().decode(DeveloperAppConfig.self, from: data)
        
        UserDefaults.standard.set(config.appColor, forKey: "appColor")
        UserDefaults.standard.set(config.fontFamily, forKey: "fontFamily")

        return config
    }
}
