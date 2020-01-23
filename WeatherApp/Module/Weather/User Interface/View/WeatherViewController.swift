//
//  WeatherWeatherViewController.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit
import MapKit
import JGProgressHUD

import StoryboardLoadable

final class WeatherViewController: UIViewController, StoryboardLoadable {
    enum Section: Int, CaseIterable {
        case temperature = 0
        case extraForecastInfo = 1
        case dailyForecast = 2
    }
    
    // MARK: Dependency inversion variable 
    var output: WeatherViewEventResponderProtocol?
    
    // MARK: IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Instance variable
    var dateFormatter:DateFormatter = DateFormatter()
    
    var forecast: Forecast? {
        didSet {
            self.title = self.forecast?.locality
            self.tableView.reloadData()
        }
    }
    
    var forecastInfos: [ForecastInfo]? {
        if let forecast: Forecast = self.forecast {
            return ForecastInfo.transform(forecast: forecast)
        }
        return nil
    }
    
    var isLoading: Bool = false {
        didSet {
            if self.isLoading {
                self.progresshud.show(in: self.view)
            } else {
                self.progresshud.dismiss(animated: true)
            }
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
    
    // MARK: private variable
    private var searchController: UISearchController!
    
    private var searchResultsTableController: SearchResultTableViewController!
    
    private var progresshud = JGProgressHUD(style: .dark)
    
    
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
        
        self.progresshud.textLabel.text = "Loading"
        
        self.dateFormatter.dateFormat = "EEEE"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        BigWeatherTableViewCell.register(tableView: &self.tableView)
        WeatherTableViewCell.register(tableView: &self.tableView)
        MovableCollectionTableViewCell.register(tableView: &self.tableView)
        
        self.output?.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.output?.viewWillAppear()
    }
    
    func initializeSearchController() {
        self.searchResultsTableController =
            self.storyboard?
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
            as? SearchResultTableViewController
        self.searchResultsTableController.delegate = self
        
        self.searchController =
            UISearchController(searchResultsController: self.searchResultsTableController)
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.barTintColor = UIColor.white
        self.searchController.searchBar.iconTintColor = UIColor.white
        self.searchController.searchBar.placeholder = "Locality"
        self.searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
    
    func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
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
        if let maxTemperature: Float = forecast.maxTemperature {
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
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Section.temperature.rawValue:
            return 1
        case Section.extraForecastInfo.rawValue:
            guard self.forecastInfos != nil else {
                return 0
            }
            return 1
        case Section.dailyForecast.rawValue:
            guard let dailyForecast: [Forecast] = self.forecast?.nextDailyForecasts else {
                return 0
            }
            return dailyForecast.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Section.temperature.rawValue:
            return 214.0
        case Section.extraForecastInfo.rawValue:
            return 90.0
        default:
            return 40.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == Section.temperature.rawValue {
            let bigWeathercell = self.tableView.dequeueReusableCell(withIdentifier: BigWeatherTableViewCell.identifier, for: indexPath)
            if var bigWeatherCell: BigWeatherTableViewCell = bigWeathercell as? BigWeatherTableViewCell {
                self.configure(cell: &bigWeatherCell, forecast: forecast)
                
                return bigWeatherCell
            }
        }
        
        if indexPath.section == Section.extraForecastInfo.rawValue {
            let cell =
                self.tableView
                    .dequeueReusableCell(
                        withIdentifier: MovableCollectionTableViewCell.identifier, for: indexPath)
            if let forecastInfos: [ForecastInfo] = self.forecastInfos,
                let movableCollectionTableViewCell = cell as? MovableCollectionTableViewCell {
                movableCollectionTableViewCell.forecastInfos = forecastInfos
                return movableCollectionTableViewCell
            }
        }
        
        if indexPath.section == Section.dailyForecast.rawValue {
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
        self.navigationItem.searchController?.dismiss(animated: true) {
            self.navigationItem.searchController?.searchBar.searchTextField.text = ""
            self.output?
                .didSelect(
                    searchResultTableViewController,
                    localSearchCompletion: localSearchCompletion)
        }
        
    }
}

private extension UISearchBar {
    var iconTintColor: UIColor? {
        
        get {
            if let textfield: UITextField = self.value(forKey: "searchField") as? UITextField {
                if let leftView = textfield.leftView as? UIImageView {
                    return leftView.tintColor
                }
            }
            return nil
        }
        
        set {
            if let color: UIColor = newValue,
                let textfield: UITextField = self.value(forKey: "searchField") as? UITextField {
                if let leftView = textfield.leftView as? UIImageView {
                    leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                    leftView.tintColor = color
                }
            }
        }
        
    }
}

