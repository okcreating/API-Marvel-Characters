//
//  ObjectModel.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import Foundation

struct Characters: Decodable {
    let data: Results
}

struct Results: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
}

struct Image: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

//enum Extension: String, Decodable {
//    case gif = "gif"
//    case jpg = "jpg"
//}

struct ComicList: Decodable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ComicSummary]?
}

struct ComicSummary: Decodable {
    let resourceURI: String?
    let name: String?
}
