//
//  DetailsViewController.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import UIKit
import SVGKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var codeLabel: UILabel!
    
    let viewModel = DetailsViewModel()
    var detailCode = ""
    let favList =  UserDefaults.standard.array(forKey: "workoutFavorite") ?? [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetailsItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (favList as AnyObject).contains(self.navigationItem.title as Any) {
            let button = UIButton(type: UIButton.ButtonType.custom)
            button.setImage(UIImage(named: "star_filled"), for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            let barButton = UIBarButtonItem(customView: button)
            self.navigationItem.rightBarButtonItem = barButton
        }
        else {
            let button = UIButton(type: UIButton.ButtonType.custom)
            button.setImage(UIImage(named: "star_empty"), for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            let barButton = UIBarButtonItem(customView: button)
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    func getDetailsItems() {
        viewModel.getDetailsItems(code: detailCode) { errorMessage in
            if let errorMessage = errorMessage {
                print("error: \(errorMessage)")
            }
            DispatchQueue.main.async {
                self.codeLabel.text = "Country Code: \(self.detailCode)"
                self.navigationItem.title = self.viewModel.detailName

                if let url = URL(string: self.viewModel.imageUri ?? "") {
                    
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url)
                        
                        DispatchQueue.main.async {
                            let svgk: SVGKImage = SVGKImage(data: data!)
                            self.flagImageView.image = svgk.uiImage
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func infoPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.wikidata.org/wiki/\(viewModel.wikiDataID)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
