//
//  Encrypter.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation
import CryptoKit

public class Encrypter {
    public static func md5(string: String) -> String? {
        guard let stringData = string.data(using: .utf8) else { return nil }
        
        let computed = Insecure.MD5.hash(data: stringData)
        return computed.map{ String(format: "%02hhx", $0) }.joined()
    }
}
