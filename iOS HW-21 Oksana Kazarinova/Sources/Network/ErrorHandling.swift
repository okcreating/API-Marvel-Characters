//
//  ErrorHandling.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 05/08/2024.
//

import Foundation

enum NetworkError: String, Error, LocalizedError {
    case notFoud = "Not found"
    case badRequest = "Bad request"
    case decodingError = "Decoding Error"

    var errorDescription: String? {
        return NSLocalizedString(rawValue, comment: "")
    }
}
