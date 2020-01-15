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

}

// MARK: WeatherInteractorOutputProtocol
extension WeatherPresenter: WeatherInteractorOutputProtocol {

}

// MARK: WeatherViewEventResponderProtocol
extension WeatherPresenter: WeatherViewEventResponderProtocol {
     func viewDidLoad() {
         
     }
}