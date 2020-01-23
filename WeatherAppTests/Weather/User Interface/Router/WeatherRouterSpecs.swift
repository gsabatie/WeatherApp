//
//  WeatherWeatherRouterSpecs.swift
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

final class WeatherRouterSpecs: QuickSpec {
   var router: WeatherRouter!

   override func spec() {
    
   }
}

extension WeatherRouter {
    
    static func forTest() -> WeatherRouter {
       let router = WeatherRouter()
       
       return router
    }
}
