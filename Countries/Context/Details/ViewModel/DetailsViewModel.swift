//
//  DetailsViewModel.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import Foundation

class DetailsViewModel {
    var detailName = ""
    var imageUri : String?
    var wikiDataID = ""
    
    func getDetailsItems(code: String, complete: @escaping((String?) -> ())) {
        DetailsService.shared.getDetailsItems(code: code) { items, errorMessage in
            if let items = items {
                self.detailName = items.name
                self.imageUri = items.flagImageURI
                self.wikiDataID = items.wikiDataID
            }
            complete(errorMessage)
        }
    }
}
