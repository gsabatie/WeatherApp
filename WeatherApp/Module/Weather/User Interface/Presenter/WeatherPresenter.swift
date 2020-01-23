//
//  WeatherWeatherPresenter.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import Foundation
import MapKit

final class WeatherPresenter {
    
    // MARK: Dependency inversion variable 
    weak var view: WeatherViewProtocol?
    var router: WeatherRouterProtocol?
    var interactor: WeatherUseCaseProtocol?
    
    // MARK: Instance Variable
    var isSearchModeActivated: Bool = false
    
    // MARK: Constructors
    init(interactor: WeatherUseCaseProtocol? = nil, router: WeatherRouterProtocol? = nil, view: WeatherViewProtocol? = nil) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    // MARK: Instance Methods
    private func presentForecastBlock(forecast: Forecast?, error: Error?) {
        self.view?.isLoading = false
        guard let forecast: Forecast = forecast, error == nil else {
            if let error: Error = error {
                self.present(error: error)
            }
            return
        }
        self.present(forecast: forecast)
    }
}

// MARK: WeatherPresentationProtocol
extension WeatherPresenter: WeatherPresentationProtocol {
    
    func present(forecast: Forecast) {
        var forecastEdited = forecast
        if let nextDailyForecasts = forecastEdited.nextDailyForecasts, !nextDailyForecasts.isEmpty {
            forecastEdited.nextDailyForecasts = Array(nextDailyForecasts.dropFirst())
        }
        self.view?.forecast = forecastEdited
    }
    
    func present(error: Error) {
        self.view?.display(errorMessage: error.localizedDescription)
    }
    
    func presentWeatherFromCurrentLocation() {
        self.view?.isLoading = true
        self.interactor?.getLatestForecast {
            (forecast: Forecast?, error: Error?) in
            DispatchQueue.main.async {
                self.presentForecastBlock(forecast: forecast, error: error)
            }
            
        }
    }
    
    func presentWeatherFrom(localSearchCompletion: MKLocalSearchCompletion) {
        self.view?.isLoading = true
        self.interactor?.getForecast(localSearchCompletion: localSearchCompletion) {
            (forecast: Forecast?, error: Error?) in
            DispatchQueue.main.async {
                self.presentForecastBlock(forecast: forecast, error: error)
            }
        }
    }
}

// MARK: WeatherInteractorOutputProtocol
extension WeatherPresenter: WeatherInteractorOutputProtocol {
    
}

// MARK: WeatherViewEventResponderProtocol
extension WeatherPresenter: WeatherViewEventResponderProtocol {

    func searchLocality(text: String) {
        isSearchModeActivated = true
        self.interactor?.getMatchedLocalitiesFrom(text: text) {
            (addresses: [MKLocalSearchCompletion]?, error: Error?) in
            self.view?.matchedAddresses = addresses
        }
    }
    
    func didSelect(
        _ searchResultTableViewController: SearchResultTableViewController,
        localSearchCompletion: MKLocalSearchCompletion) {
        self.presentWeatherFrom(localSearchCompletion: localSearchCompletion)
    }
    
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
