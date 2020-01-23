//
//  WeatherWeatherviewcontrollerSpecs.swift
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

final class WeatherViewControllerSpecs: QuickSpec {

    var viewController: WeatherViewController!
    var presenter: WeatherViewEventResponderProtocolMock!

    override func spec() {
    
    }
}

extension WeatherViewController {
    static func forTest(presenterMock: inout WeatherViewEventResponderProtocol) -> WeatherViewController  {
           let viewController = WeatherViewController()
           viewController.output = presenterMock
       
           return viewController
    }
}

fileprivate extension WeatherViewEventResponderProtocolMock {

}