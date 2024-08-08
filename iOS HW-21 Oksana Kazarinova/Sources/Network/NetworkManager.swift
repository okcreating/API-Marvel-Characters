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

    func createURL(path: Path) -> URL? {

        let publicKey = "79eaebd384b9c4dc6d5b8498c70de65f"
        let privateKey = "56d8367e02b0b31038ed8293b79bd42c71cbe0e7"
        let ts = String(Date.now.timeIntervalSince1970)
        let hashString = "\(ts)\(privateKey)\(publicKey)".md5

        let tsQueryItem = URLQueryItem(name: "ts", value: ts)
        let apiQueryItem = URLQueryItem(name: "apikey", value: publicKey)
        let hashQueryItem = URLQueryItem(name: "hash", value: hashString)

        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = path.rawValue
        components.queryItems = [tsQueryItem, apiQueryItem, hashQueryItem]

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
