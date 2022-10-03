//
//  DetailResponse.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

struct DetailResponse: Codable {
    let detailData: DetailData

    enum CodingKeys: String, CodingKey {
      case detailData = "data"
    }

}

struct DetailData: Codable {
    let flagImageURI: String
    let name: String
    let wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case flagImageURI = "flagImageUri"
        case name
        case wikiDataID = "wikiDataId"
    }
}
