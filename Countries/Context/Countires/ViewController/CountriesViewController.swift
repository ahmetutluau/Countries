//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 28.09.2022.
//

import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = CountriesViewModel()
    
    var rowsWhichAreChecked = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        getCountriesItems()
        
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        rowsWhichAreChecked = UserDefaults.standard.array(forKey: "workoutFavorite") ?? []
        tableView.reloadData()

    }
    
    func getCountriesItems() {
        viewModel.getCountriesItems { errorMessage in
            if let errorMessage = errorMessage {
                print("error: \(errorMessage)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countriesItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var rowsWhichAreChecked = UserDefaults.standard.array(forKey: "workoutFavorite") as? [String] ?? [String]()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCell") as! CountriesCell
        
        cell.countryLabel.text = viewModel.countriesItems[indexPath.row].name
        
        if rowsWhichAreChecked.contains(viewModel.countriesItems[indexPath.row].name) {
            cell.favBtn.setImage(#imageLiteral(resourceName: "star_filled"), for: .normal)
        } else {
            cell.favBtn.setImage(#imageLiteral(resourceName: "star_empty"), for: .normal)
        }
        
        cell.favButtonPressed = { [ weak self ] in
            if rowsWhichAreChecked.contains(self!.viewModel.countriesItems[indexPath.row].name) {
                let removeIdx = rowsWhichAreChecked.lastIndex(where: {$0 == self!.viewModel.countriesItems[indexPath.row].name})
                rowsWhichAreChecked.remove(at: removeIdx!)
                
                cell.favBtn.setImage(#imageLiteral(resourceName: "star_empty"), for: .normal)
            } else {
                cell.favBtn.setImage(#imageLiteral(resourceName: "star_filled"), for: .normal)
                rowsWhichAreChecked.append(self!.viewModel.countriesItems[indexPath.row].name)
            }
            UserDefaults.standard.set(rowsWhichAreChecked, forKey: "workoutFavorite")
            self?.tableView.reloadData()
        }

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(DetailsViewController.self)") as! DetailsViewController
        controller.detailCode = viewModel.countriesItems[indexPath.row].code
        show(controller, sender: nil)
        
    }

}
