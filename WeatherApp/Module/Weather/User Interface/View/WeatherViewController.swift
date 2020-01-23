//
//  WeatherWeatherViewController.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit
import MapKit

import StoryboardLoadable

final class WeatherViewController: UIViewController, StoryboardLoadable {
    
    // MARK: Dependency inversion variable 
    var output: WeatherViewEventResponderProtocol?
    
    // MARK: IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Instance variable
    var dateFormatter:DateFormatter = DateFormatter()
    
    private var searchController: UISearchController!
    
    private var searchResultsTableController: SearchResultTableViewController!
    
    var forecast: Forecast? {
        didSet {
            self.title = self.forecast?.locality
            self.tableView.reloadData()
        }
    }
    
    var matchedAddresses: [MKLocalSearchCompletion]? {
        didSet {
            if let matchedAddresses: [MKLocalSearchCompletion] =  self.matchedAddresses {
                self.searchResultsTableController.addresses = matchedAddresses
            } else {
                self.searchResultsTableController.addresses = [MKLocalSearchCompletion]()
            }
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [
            UIColor(red: 0, green: 51/255, blue: 115/255, alpha: 1.0).cgColor,
            UIColor(red: 0, green: 115/255, blue: 164/255, alpha: 1.0).cgColor
        ]
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.configureNavigationController()
        
        self.initializeSearchController()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        BigWeatherTableViewCell.register(tableView: &self.tableView)
        WeatherTableViewCell.register(tableView: &self.tableView)
        
        self.dateFormatter.dateFormat = "EEEE"
        
        self.output?.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.output?.viewWillAppear()
    }
    
    func initializeSearchController() {
        self.searchResultsTableController =
            self.storyboard?.instantiateViewController(withIdentifier: "SearchResultTableViewController") as? SearchResultTableViewController
        self.searchResultsTableController.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.searchResultsTableController)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Locality"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    func configure(cell: inout BigWeatherTableViewCell, forecast: Forecast?) {
        if let forecast: Forecast = forecast {
            if let currentTemperature: Float = forecast.currentTemperature {
                cell.set(mainLabelText: "\(Int(currentTemperature))°")
            }
            if let summary: String = forecast.summary {
                cell.set(subLabelText: "\(summary)")
            }
        } else {
            cell.set(mainLabelText: "N/A°")
            cell.set(subLabelText: "You must accept the location permission")
        }
    }
    
    func configure(cell: inout WeatherTableViewCell, forecast: Forecast) {
        if let minTemperature: Float = forecast.minTemperature {
            cell.set(leftValueText: "\(Int(minTemperature))")
        }
        if let maxTemperature: Float = forecast.minTemperature {
            cell.set(rightValueText: "\(Int(maxTemperature))")
        }
        cell.set(statusText: self.dateFormatter.string(from: forecast.date))
        if let iconName: String = forecast.iconName,
            let image: UIImage = UIImage(named: iconName)
        {
            cell.set(iconImage: image)
        }
    }
    func configureCellsWithPlaceholder() {
        
    }
}

// MARK: WeatherViewProtocol
extension WeatherViewController: WeatherViewProtocol {
    
    
    func display(errorMessage: String) {
        
    }
    
    
}

// MARK: - Extension UITableDelegate
extension WeatherViewController: UITableViewDelegate {
    
}

// MARK: - Extension UITableViewDataSource
extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            guard let dailyForecast: [Forecast] = self.forecast?.nextDailyForecasts else {
                return 0
            }
            return dailyForecast.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            return 214.0
        default:
            return 40.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let bigWeathercell = self.tableView.dequeueReusableCell(withIdentifier: BigWeatherTableViewCell.identifier, for: indexPath)
            if var bigWeatherCell: BigWeatherTableViewCell = bigWeathercell as? BigWeatherTableViewCell {
                self.configure(cell: &bigWeatherCell, forecast: forecast)
                return bigWeatherCell
            }
        }
        
        if indexPath.section == 1 {
            let weatherCell =
                self.tableView
                    .dequeueReusableCell(
                        withIdentifier: WeatherTableViewCell.identifier, for: indexPath)
            
            
            if let nextDailyForecast: [Forecast] = self.forecast?.nextDailyForecasts,
                var weatherCell: WeatherTableViewCell = weatherCell as? WeatherTableViewCell
            {
                let dailyForecast: Forecast = nextDailyForecast[indexPath.row]
                self.configure(cell: &weatherCell, forecast: dailyForecast)
                return weatherCell
            }
            
        }
        let cell = self.tableView.dequeueReusableCell(withIdentifier: BigWeatherTableViewCell.identifier, for: indexPath)
        return cell
    }
}

// MARK: - Extension UISearchResultsUpdating
extension WeatherViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let whitespaceCharacterSet = CharacterSet.whitespaces
        let strippedString =
            searchController.searchBar.text!.trimmingCharacters(in: whitespaceCharacterSet)
        self.output?.searchLocality(text: strippedString)
    }
}

// MARK: - Extension SearchResultTableViewControllerDelegate
extension WeatherViewController: SearchResultTableViewControllerDelegate {
    func didSelect(
        _ searchResultTableViewController: SearchResultTableViewController,
        localSearchCompletion: MKLocalSearchCompletion
    ) {
        self.navigationItem.searchController?.dismiss(animated: true, completion: nil)
        self.navigationItem.searchController?.searchBar.searchTextField.text = ""
        self.output?
            .didSelect(
                searchResultTableViewController,
                localSearchCompletion: localSearchCompletion)
    }
}


