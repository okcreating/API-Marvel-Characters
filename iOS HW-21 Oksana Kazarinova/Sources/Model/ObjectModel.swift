//
//  ObjectModel.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import Foundation

struct Characters: Decodable {
    let characters: [Character]
}

struct Character: Codable {
    let code: Int?
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
}

struct Image: Codable {
    let path: String?
    let `extension`: String?
}

struct ComicList: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ComicSummary]?
}

struct ComicSummary: Codable {
    let resourceURI: String
    let name: String?
}
