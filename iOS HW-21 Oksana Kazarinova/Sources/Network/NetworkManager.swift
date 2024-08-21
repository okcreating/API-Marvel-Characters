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

    func createURL(path: Path) -> String? {

        let publicKey = "79eaebd384b9c4dc6d5b8498c70de65f"
        let privateKey = "56d8367e02b0b31038ed8293b79bd42c71cbe0e7"
        //let ts = String(Date.now.timeIntervalSince1970)
        let ts = "1"
        let hashString = "\(ts)\(privateKey)\(publicKey)".md5

        let limitQueryItem = URLQueryItem(name: "limit", value: "20")
        let tsQueryItem = URLQueryItem(name: "ts", value: ts)
        let apiQueryItem = URLQueryItem(name: "apikey", value: publicKey)
        let hashQueryItem = URLQueryItem(name: "hash", value: hashString)

        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = path.rawValue
        components.queryItems = [limitQueryItem, tsQueryItem, apiQueryItem, hashQueryItem]

        let url = components.url?.absoluteString ?? ""
        print(url)
        return url
    }

    func getData(completion: @escaping (Result<[Character], NetworkError>) -> ()) {
        let url = createURL(path: .listOfCharacters)
        guard let marvelUrl = url else { return }
        AF.request(marvelUrl)
            .validate()
            .response { response in
                guard let data = response.data else {
                    if response.error != nil {
                        completion(.failure(NetworkError.badRequest))
                    }
                    return
                }
                guard let results = try? JSONDecoder().decode(Characters.self, from: data) else {
                    completion(.failure(NetworkError.decodingError))
                    return
                }
                completion(.success(results.data.results))
            }
        }
    }





