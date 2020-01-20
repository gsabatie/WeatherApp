//
//  WeatherWeatherViewController.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit

import StoryboardLoadable

final class WeatherViewController: UIViewController, StoryboardLoadable {
    
    // MARK: Dependency inversion variable 
    var output: WeatherViewEventResponderProtocol?
    
    // MARK: IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Instance variable
    var forecast: Forecast? {
        didSet {
            self.tableView.reloadData()
        }
    }
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 0, green: 51/255, blue: 115/255, alpha: 1.0).cgColor, UIColor(red: 0, green: 115/255, blue: 164/255, alpha: 1.0).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        BigWeatherTableViewCell.register(tableView: &self.tableView)
        
        self.output?.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.output?.viewWillAppear()
    }
    func configure(cell: inout BigWeatherTableViewCell, forecast: Forecast?) {
        if let forecast: Forecast = forecast {
            cell.set(mainLabelText: "\(Int(forecast.currentTemperature))°")
            cell.set(subLabelText: "\(forecast.summary)")
            
        } else {
            cell.set(mainLabelText: "N/A°")
            cell.set(subLabelText: "You must accept the location permission")
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            return 214.0
        default:
            return 18.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: BigWeatherTableViewCell.identifier, for: indexPath)
        
        
        
        if var bigWeatherCell: BigWeatherTableViewCell = cell as? BigWeatherTableViewCell {
            self.configure(cell: &bigWeatherCell, forecast: forecast)
            return bigWeatherCell
        }
        return cell
    }
    
    
}


