//
//  ApiService.swift
//  yccurrency
//
//  Created by mac on 16/2/25.
//

import Foundation
import KeychainSwift

enum Error: Swift.Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

struct APIService {
    private let urlSession: URLSession
    private let baseURL: String
    private let keychain: KeychainSwift

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        self.keychain = KeychainSwift()
        self.baseURL = ApiConstant.baseURL
        keychain.set(ApiConstant.apiToken, forKey: "token")
    }

    func post<T: Decodable>(type: T.Type, endpoint: String, body: Encodable?)
        async throws
        -> T
    {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            throw Error.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        if let body = body {
            request.httpBody = try? JSONEncoder().encode(body)
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, _) = try await urlSession.data(for: request)

        return try JSONDecoder().decode(T.self, from: data)
    }

    func get<T: Decodable>(type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            throw Error.invalidURL
        }

        let token = keychain.get("token") ?? ""

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")

        let (data, _) = try await urlSession.data(for: request)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
