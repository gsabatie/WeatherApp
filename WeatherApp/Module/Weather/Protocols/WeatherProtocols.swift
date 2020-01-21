//
//  WeatherWeatherProtocols.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

typealias ForecastBlock = (_ forecast: Forecast?, _ error: Error?) -> ()
typealias AutoCompletionBlock = (_ matchedText: [MKLocalSearchCompletion]?, _ error: Error?) -> ()

//sourcery: AutoMockable
protocol WeatherViewProtocol: class{
    var output: WeatherViewEventResponderProtocol? {get set}
    
    var forecast: Forecast? {get set}
    
    var matchedAddresses: [MKLocalSearchCompletion]? {get set}
    
    func display(errorMessage: String)
}

//sourcery: AutoMockable
protocol WeatherViewEventResponderProtocol {
    func viewDidLoad()
    func viewWillAppear()
    
    func searchLocality(text: String)
}

//sourcery: AutoMockable
protocol WeatherPresentationProtocol: class {
    func presentWeatherFromCurrentLocation()
}

//sourcery: AutoMockable
protocol WeatherUseCaseProtocol: class {
    
    func getMatchedLocalitiesFrom(text: String, completion: @escaping AutoCompletionBlock)
    
    func getStoredForecast() -> Forecast?
    
    func getForecast(completion: @escaping ForecastBlock)
    func getForecast(locality: String, completion: @escaping ForecastBlock)
    func getForeCast(location: CLLocation, completion: @escaping ForecastBlock)
}

//sourcery: AutoMockable
protocol WeatherInteractorOutputProtocol: class {
  
}

//sourcery: AutoMockable
protocol WeatherRouterProtocol: class {
    func present(from viewController:UIViewController)
}
