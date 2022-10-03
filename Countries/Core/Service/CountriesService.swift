//
//  CountriesManager.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

class CountriesService {
    static let shared = CountriesService()
    
    func getCountriesItems(complete: @escaping(([CountryData]?, String?) -> ())) {
        let url = "\(NetworkHelper.shared.baseUrl)/geo/countries"
        NetworkManager.shared.request(type: CountryResponse.self,
                                      url: url,
                                      method: .get,
                                      headers:[(vi:"90ab06833emsh2ffcbe28507622cp1615c9jsn0515eec83d7a", k:"X-RapidAPI-Key")]) { response in
            switch response{
            case .success(let items):
                complete(items.countryData,nil)
            case .failure(let error):
                complete(nil,error.rawValue)
            }
        }
    }
}
