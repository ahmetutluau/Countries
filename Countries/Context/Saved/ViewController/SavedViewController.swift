//
//  SavedViewController.swift
//  Countries
//
//  Created by MAC on 29.09.2022.
//

import UIKit

class SavedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    var favCountries = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
    }
    override func viewDidAppear(_ animated: Bool) {
        favCountries = UserDefaults.standard.array(forKey: "workoutFavorite") ?? [""]
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}
extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCountriesCell", for: indexPath) as! SavedCountriesCell
        
        cell.savedCountryLabel.text = (favCountries[indexPath.row] as! String)
        
        return cell
    }
}
