////
//CustomErrorServer.swift
//MyChallenge
//
//Created by Basel Baragabah on 07/09/2024.
//Copyright © 2024 Basel Baragabah. All rights reserved.
//

import Foundation

// MARK: - CustomErrorServer
struct CustomErrorServer: Codable {
    let status: Int
    let success: Bool
    let error: ServerError?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case error = "error"
    }
}

// MARK: - ServerError
struct ServerError: Codable {
    let code: String?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }
}
