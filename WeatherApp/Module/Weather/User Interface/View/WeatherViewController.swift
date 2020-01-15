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

    // MARK: Instance variable

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.output?.viewDidLoad()
    }
}

// MARK: WeatherViewProtocol
extension WeatherViewController: WeatherViewProtocol {

}
