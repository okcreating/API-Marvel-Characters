//
//  ObjectModel.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import Foundation

struct Welcome: Decodable {
    let code: Int?
        let status, copyright, attributionText, attributionHTML: String?
        let etag: String?
        let data: Characters
}

struct Characters: Decodable {
    let offset, limit, total, count: Int?
    let results: [Character]
}


//public struct Characters: Decodable {
//    let characters: [Character]
//}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Image?
    let comics: ComicList?
}

struct Image: Decodable {
    let path: String?
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Decodable {
    case gif = "gif"
    case jpg = "jpg"
}

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
