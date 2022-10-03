//
//  CountriesViewModel.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

class CountriesViewModel {
    var countriesItems = [CountryData]()
    
    func getCountriesItems(complete: @escaping((String?) -> ())) {
        CountriesService.shared.getCountriesItems { items, errorMessage in
            if let items = items {
                self.countriesItems = items
                
            }
            complete(errorMessage)
        }
    }
}
