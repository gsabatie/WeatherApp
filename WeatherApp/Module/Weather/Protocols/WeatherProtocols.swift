//
//  WeatherWeatherProtocols.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit
import CoreLocation

typealias ForecastBlock = (_ forecast: Forecast?, _ error: Error?) -> ()

//sourcery: AutoMockable
protocol WeatherViewProtocol: class{
    var output: WeatherViewEventResponderProtocol? {get set}
    
    var forecast: Forecast? {get set}
    
    func display(errorMessage: String)
}

//sourcery: AutoMockable
protocol WeatherViewEventResponderProtocol {
    func viewDidLoad()
    func viewWillAppear()
}

//sourcery: AutoMockable
protocol WeatherPresentationProtocol: class {
    func presentWeatherFromCurrentLocation()
}

//sourcery: AutoMockable
protocol WeatherUseCaseProtocol: class {

    func getForecast(completion: @escaping ForecastBlock)
    func getForecast(locality: String, completion: @escaping ForecastBlock)
    func getForeCast(location:CLLocationCoordinate2D, completion: @escaping ForecastBlock)
}

//sourcery: AutoMockable
protocol WeatherInteractorOutputProtocol: class {

}

//sourcery: AutoMockable
protocol WeatherRouterProtocol: class {
    func present(from viewController:UIViewController)
}
