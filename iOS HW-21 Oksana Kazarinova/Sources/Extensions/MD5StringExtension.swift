//
//  MD5StringExtension.swift
//  iOS HW-21 Oksana Kazarinova
//
//  Created by Oksana Kazarinova on 08/08/2024.
//

import Foundation
import CryptoKit

extension String {
var md5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
