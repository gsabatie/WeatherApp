//
//  WeatherWeatherPresenterSpecs.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import XCTest
import Quick
import Nimble
import SwiftyMocky

@testable import WeatherApp


final class WeatherPresenterSpecs: QuickSpec {

    var presenter: WeatherPresenter!
    var interactorMock: WeatherUseCaseProtocolMock!
    var viewMock: WeatherViewProtocolMock!
    var router: WeatherRouterProtocolMock!

    override func spec() {
    
    }
}

extension WeatherPresenter {
    static func forTest(interactorMock: inout WeatherUseCaseProtocol!,
                         routerMock: WeatherRouterProtocol?,
                         viewMock: WeatherViewProtocol?) -> WeatherPresenter {
       let presenter = WeatherPresenter(interactor: interactorMock, router: routerMock, view: viewMock)
       
       return presenter
    }
}

fileprivate extension WeatherUseCaseProtocolMock {

}

fileprivate extension WeatherViewProtocolMock {
    
}

fileprivate extension WeatherRouterProtocolMock {
    
}
