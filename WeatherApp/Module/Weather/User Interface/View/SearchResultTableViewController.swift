//
//  SearchResultTableViewController.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 21/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit
import MapKit

protocol SearchResultTableViewControllerDelegate {
    func didSelect(
        _ searchResultTableViewController: SearchResultTableViewController,
        localSearchCompletion: MKLocalSearchCompletion)
}

class SearchResultTableViewController: UITableViewController {

    var addresses: [MKLocalSearchCompletion] = [MKLocalSearchCompletion]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var delegate: SearchResultTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.tableView.tableFooterView = UIView()
        
        SearchResultTableViewCell.register(tableView: &self.tableView)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath)
        
        if let searchResultCell: SearchResultTableViewCell = cell as? SearchResultTableViewCell {
        let localSearchCompletion: MKLocalSearchCompletion = self.addresses[indexPath.row]
            searchResultCell.set(
                mainLabelText: localSearchCompletion.title,
                range: localSearchCompletion.titleHighlightRanges)
            return searchResultCell
        }
         
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let localSearchCompletion: MKLocalSearchCompletion = self.addresses[indexPath.row]
        self.delegate?.didSelect(self, localSearchCompletion: localSearchCompletion)
    }
}
