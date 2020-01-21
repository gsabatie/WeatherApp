//
//  WeatherWeatherInteractor.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import Foundation
import CoreLocation
import EasyOSLogger

final class WeatherInteractor: NSObject {
    
    // MARK: Dependency inversion variable 
    weak var output: WeatherInteractorOutputProtocol?
    
    // MARK: Instance Variable
    let addressConverter: AddressConverter
    let darkSkyService: DarkSky
    let locationManager: CLLocationManager
    let realmManager: RealmManager
    
    //MARK: private variable
    private var currentLocation: CLLocation? {
        didSet {
            if let location: CLLocation = self.currentLocation,
                let completion: ForecastBlock = self.currentLoactionForecastBlock
            {
                self.getForeCast(location: location, completion: completion)
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
        self.realmManager = RealmManager()
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
}

// MARK: WeatherUseCaseProtocol
extension WeatherInteractor: WeatherUseCaseProtocol {
    
    func getStoredForecast() -> Forecast? {
        return self.realmManager.getLatestForecast()
    }
    
    func getForecast(completion: @escaping ForecastBlock) {
        if let location: CLLocation = self.currentLocation {
            self.getForeCast(location: location, completion: completion)
        } else {
            self.locationManager.requestLocation()
            self.currentLoactionForecastBlock = completion
        }
        
        
    }
    
    func getForecast(locality: String, completion: @escaping ForecastBlock) {
        self.addressConverter.convert(address: locality) { (location: CLLocation?, error: Error?) in
            guard let location: CLLocation = location, error == nil else {
                completion(nil, error)
                return
            }
            self.getForeCast(location: location, completion: completion)
        }
        
        
    }
    
    func getForeCast(location: CLLocation, completion: @escaping ForecastBlock) {
        self.darkSkyService.getForecast(location: location, time: nil) {
            (forecastResponse: ForecastRequestResponse?, error: Error?) in
            guard let forecastResponse:ForecastRequestResponse = forecastResponse,
                error == nil else
            {
                completion(nil, error)
                return
            }
            var forecast: Forecast = Forecast(request: forecastResponse)
            self.addressConverter.name(location: location) {
                (locality: String?, error: Error?) in
                if let error = error {
                    Log.error(error.localizedDescription)
                      completion(nil, error)
                    return
                }
                if let locality = locality  {
                    forecast.locality = locality
                self.realmManager.save(forecast: forecast)
                completion(forecast, nil)
                    return
                }
            }
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

