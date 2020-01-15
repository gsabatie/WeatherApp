//
//  WeatherWeatherInteractor.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import Foundation

final class WeatherInteractor {
 
    // MARK: Dependency inversion variable 
    weak var output: WeatherInteractorOutputProtocol?

    // MARK: Instance Variable

    // MARK: Constructors
    init(output: WeatherInteractorOutputProtocol? = nil) {
        self.output = output
    }
}

// MARK: WeatherUseCaseProtocol
extension WeatherInteractor: WeatherUseCaseProtocol {

}
