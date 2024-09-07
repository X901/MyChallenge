////
//DeveloperAppConfigRepositoryTests.swift.swift
//MyChallengeTests
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import XCTest
@testable import MyChallenge

final class DeveloperAppConfigRepositoryTests: XCTestCase {

    func testReadDeveloperAppConfig() throws {
        
        let repository = LocalAppConfigRepository()
        
        let developerAppConfig: DeveloperAppConfig
        
        do {
            developerAppConfig = try repository.fetchAppConfig()
        } catch {
            XCTFail("Failed to read the JSON file: \(error)")
            return

        }
        
        print("ID: \(developerAppConfig.id)")
        print("Store: \(developerAppConfig.store)")
        print("App Color: \(developerAppConfig.appColor)")
        print("Font Family: \(developerAppConfig.fontFamily)")

        XCTAssertEqual(developerAppConfig.id, 1328842359)
        XCTAssertEqual(developerAppConfig.store, "developers")
        XCTAssertEqual(developerAppConfig.appColor, 4282466370)
        XCTAssertEqual(developerAppConfig.fontFamily, "dinnextltarabic-regular")

    }

}
