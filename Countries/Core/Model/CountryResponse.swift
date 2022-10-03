//
//  CountryResponse.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

struct CountryResponse: Codable {
    let countryData: [CountryData]
  
  enum CodingKeys: String, CodingKey {
    case countryData = "data"
  }
}

struct CountryData: Codable {
    let code: String
    let currencyCodes: [String]
    let name, wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}
