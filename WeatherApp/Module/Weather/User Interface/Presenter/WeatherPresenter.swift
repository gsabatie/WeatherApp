//
//  WeatherWeatherPresenter.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import Foundation

final class WeatherPresenter {

    // MARK: Dependency inversion variable 
    weak var view: WeatherViewProtocol?
    var router: WeatherRouterProtocol?
    var interactor: WeatherUseCaseProtocol?

    // MARK: Instance Variable

    // MARK: Constructors
    init(interactor: WeatherUseCaseProtocol? = nil, router: WeatherRouterProtocol? = nil, view: WeatherViewProtocol? = nil) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

     // MARK: Instance Methods
    
}

// MARK: WeatherPresentationProtocol
extension WeatherPresenter: WeatherPresentationProtocol {
    func presentWeatherFromCurrentLocation() {
        self.interactor?.getForecast {
            (forecast: Forecast?, error: Error?) in
            guard var forecast: Forecast = forecast, error == nil else {
                if let error: Error = error {
                    self.view?.display(errorMessage: error.localizedDescription)
                }
                return
            }
            if let nextDailyForecasts = forecast.nextDailyForecasts, !nextDailyForecasts.isEmpty {
                forecast.nextDailyForecasts = Array(nextDailyForecasts.dropFirst())
            }
            self.view?.forecast = forecast
        }
    }
}

// MARK: WeatherInteractorOutputProtocol
extension WeatherPresenter: WeatherInteractorOutputProtocol {

}

// MARK: WeatherViewEventResponderProtocol
extension WeatherPresenter: WeatherViewEventResponderProtocol {
     func viewDidLoad() {
        if var storredForecast = self.interactor?.getStoredForecast(),
            let nextDailyForecasts = storredForecast.nextDailyForecasts,
            !nextDailyForecasts.isEmpty
        {
            storredForecast.nextDailyForecasts = Array(nextDailyForecasts.dropFirst())
            self.view?.forecast = storredForecast
        }
            
     }
    
    func viewWillAppear() {
        self.presentWeatherFromCurrentLocation()
    }
}
