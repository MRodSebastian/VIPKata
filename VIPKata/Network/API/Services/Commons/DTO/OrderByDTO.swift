//
//  OrderByDTO.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 6/4/22.
//

import Foundation

public enum OrderByDTO: String, Codable {
    case name = "name"
    case modified = "modified"
    case reverseName = "-name"
    case reverseModified = "-modified"
}
