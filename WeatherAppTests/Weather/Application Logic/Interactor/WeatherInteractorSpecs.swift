//
//  WeatherWeatherInteractorSpecs.swift
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


final class WeatherInteractorSpecs: QuickSpec {

    var interactor: WeatherInteractor!
    var presenterMock: InteractorOutputProtocolMock!

    override func spec() {
    
    }
}

extension WeatherInteractor {
    static func forTest(presenterMock: inout WeatherInteractorOutputProtocolMock) -> WeatherInteractor  {
       let interactor = WeatherInteractor(output: presenterMock)
       
       return interactor
    }
}

fileprivate extension  WeatherInteractorMock {

}