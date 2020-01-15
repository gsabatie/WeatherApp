//
//  WeatherWeatherProtocols.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol WeatherViewProtocol: class{
    var output: WeatherViewEventResponderProtocol? {get set}
}

//sourcery: AutoMockable
protocol WeatherViewEventResponderProtocol {
    func viewDidLoad()
}

//sourcery: AutoMockable
protocol WeatherPresentationProtocol: class {

}

//sourcery: AutoMockable
protocol WeatherUseCaseProtocol: class {

}

//sourcery: AutoMockable
protocol WeatherInteractorOutputProtocol: class {

}

//sourcery: AutoMockable
protocol WeatherRouterProtocol: class {
    func present(from viewController:UIViewController)
}