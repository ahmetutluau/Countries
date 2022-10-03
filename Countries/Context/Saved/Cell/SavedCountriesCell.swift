//
//  SavedCountriesCell.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import UIKit

class SavedCountriesCell: UITableViewCell {

    @IBOutlet weak var savedCountryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        savedCountryLabel.layer.borderColor = UIColor.darkGray.cgColor
        savedCountryLabel.layer.borderWidth = 1.5
        savedCountryLabel.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
