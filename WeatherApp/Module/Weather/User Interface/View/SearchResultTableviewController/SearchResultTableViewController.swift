//
//  SearchResultTableViewController.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 21/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit
import MapKit

protocol SearchResultTableViewControllerDelegate: class {
    func didSelect(
        _ searchResultTableViewController: SearchResultTableViewController,
        localSearchCompletion: MKLocalSearchCompletion)
}

final class SearchResultTableViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var addresses: [MKLocalSearchCompletion] = [MKLocalSearchCompletion]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    weak var delegate: SearchResultTableViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        
        SearchResultTableViewCell.register(tableView: &self.tableView)
    }
}

// MARK: - Extension UITableViewDatasource
extension SearchResultTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell =
            tableView
                .dequeueReusableCell(
                    withIdentifier: SearchResultTableViewCell.identifier,
                    for: indexPath)
        
        if let searchResultCell: SearchResultTableViewCell = cell as? SearchResultTableViewCell {
            let localSearchCompletion: MKLocalSearchCompletion = self.addresses[indexPath.row]
            searchResultCell.set(
                mainLabelText: localSearchCompletion.title,
                range: localSearchCompletion.titleHighlightRanges)
            return searchResultCell
        }
        return cell
    }
}

// MARK: - Extension UItableViewDelegate
extension SearchResultTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let localSearchCompletion: MKLocalSearchCompletion = self.addresses[indexPath.row]
        self.delegate?.didSelect(self, localSearchCompletion: localSearchCompletion)
    }
}


