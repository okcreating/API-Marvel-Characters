//
//  NetworkManager.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import Foundation

final class NetworkManager {

    enum Path: String {
        case v1Cards = "/v1/public/characters"
        case wrongURL = "/v0/neverfindable"
    }

    func createURL(path: Path, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.magicthegathering.io"
        components.path = path.rawValue
        components.queryItems = queryItems
        return components.url
    }

    func createRequest {
let request = URLRequest(url: <#T##URL#>)
    }
}
