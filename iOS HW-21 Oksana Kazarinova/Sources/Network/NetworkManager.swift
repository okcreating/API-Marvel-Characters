//
//  NetworkManager.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import Foundation
import Alamofire

enum Path: String {
    case listOfCharacters = "/v1/public/characters"
    case wrongURL = "/v0/neverfindable"
}

final class NetworkManager {

    var host: String
    var path: Path
    var queryItems: [URLQueryItem]

    init(host: String, path: Path, queryItems: [URLQueryItem]) {
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }

    func createURL(host: String, path: Path, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path.rawValue
        components.queryItems = queryItems
        return components.url
    }

    func createRequest(url: URL?) -> URLRequest? {
        guard let url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
    }

    func getData {
        AF.
    }
}
