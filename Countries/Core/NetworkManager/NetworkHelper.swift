//
//  NetworkHelper.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
enum ErrorTypes: String, Error {
    case invalidData = "invalid data"
    case invalidUrl = "invalid url"
    case generalError = "an error happened"
}
class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseUrl = "https://wft-geo-db.p.rapidapi.com/v1"

}
