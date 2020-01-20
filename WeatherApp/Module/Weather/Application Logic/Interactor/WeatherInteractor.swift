//
//  WeatherWeatherInteractor.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import Foundation
import CoreLocation

final class WeatherInteractor: NSObject {
    
    // MARK: Dependency inversion variable 
    weak var output: WeatherInteractorOutputProtocol?
    
    // MARK: Instance Variable
    let addressConverter: AddressConverter
    let darkSkyService: DarkSky
    let locationManager: CLLocationManager
    
    //MARK: private variable
    private var currentLocation: CLLocation? {
        didSet {
            if let location: CLLocation = self.currentLocation,
                let completion: ForecastBlock = self.currentLoactionForecastBlock
            {
                self.getForeCast(location: location.coordinate, completion: completion)
            }
        }
    }
    
    private var currentLoactionForecastBlock: ForecastBlock?
    
    // MARK: Constructors
    init(output: WeatherInteractorOutputProtocol? = nil) {
        self.output = output
        self.addressConverter = AddressConverter()
        self.darkSkyService = DarkSky()
        self.locationManager = CLLocationManager()
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: WeatherUseCaseProtocol
extension WeatherInteractor: WeatherUseCaseProtocol {
    func getForecast(completion: @escaping ForecastBlock) {
        if let location: CLLocation = self.currentLocation {
            self.getForeCast(location: location.coordinate, completion: completion)
        } else {
            self.locationManager.requestLocation()
            self.currentLoactionForecastBlock = completion
        }
        
        
    }
    
    func getForecast(locality: String, completion: @escaping ForecastBlock) {
        self.addressConverter.convert(address: locality) { (location: CLLocationCoordinate2D?, error: Error?) in
            guard let location: CLLocationCoordinate2D = location, error == nil else {
                completion(nil, error)
                return
            }
            self.getForeCast(location: location, completion: completion)
        }
        
        
    }
    
    func getForeCast(location:CLLocationCoordinate2D, completion: @escaping ForecastBlock) {
        self.darkSkyService.getForecast(location: location, time: nil) {
            (forecastResponse: ForecastRequestResponse?, error: Error?) in
            guard let forecastResponse:ForecastRequestResponse = forecastResponse,
                error == nil else
            {
                completion(nil, error)
                return
            }
            let forecast: Forecast = Forecast(request: forecastResponse)
            completion(forecast, nil)
            
        }
    }
}

// MARK: - Extension CLLocationManagerDelegate
extension WeatherInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.currentLocation = location
            manager.stopUpdatingLocation()
        } else {
            self.currentLocation = nil
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}

