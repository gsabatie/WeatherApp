//
//  DarkSkySpecs.swift
//  WeatherAppTests
//
//  Created by guillaume sabatié on 14/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import Quick
import Nimble
import CoreLocation

@testable import WeatherApp


final class DarkSkySpecs: QuickSpec {
    
    private var darkSky: DarkSkyService!
    
    override func spec() {
        
        context("Forecast Request") {
            context("lyon weather") {
                self.darkSky = DarkSkyService()
                
                let lyonLocation: CLLocation
                    = CLLocation(latitude: 45.75801, longitude: 4.8001016)
            
                it("should have a forecast") {
                    self.darkSky.getForecast(location: lyonLocation, time: nil) {
                        (response: ForecastRequestResponse? ,error: Error?) in
                        expect(error).to(beNil())
                        expect(response).toNot(beNil())
                        expect(response?.currently.temperature).notTo(beNil())
                        expect(response?.currently.summary).notTo(beNil())
                    }
                }
            }
        }
    
    }
}
