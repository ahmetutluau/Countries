//
//  CountriesCell.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import UIKit

class CountriesCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    var favButtonPressed : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()

        countryLabel.layer.borderColor = UIColor.darkGray.cgColor
        countryLabel.layer.borderWidth = 1.5
        countryLabel.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favBtn(_ sender: UIButton) {
        favButtonPressed()
    }

}
