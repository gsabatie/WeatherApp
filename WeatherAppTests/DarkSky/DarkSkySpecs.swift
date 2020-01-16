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
    
    private var darkSky: DarkSky!
    
    override func spec() {
        
        context("Forecast Request") {
            context("lyon weather") {
                self.darkSky = DarkSky()
                
                let lyonCoordinate: CLLocationCoordinate2D
                    = CLLocationCoordinate2D(latitude: 45.75801, longitude: 4.8001016)
                
                it("should respond 400") {
                    self.darkSky.getForecast(location: lyonCoordinate, time: nil) {
                        (response: ForecastRequestResponse? ,error: Error?) in
                        expect(error).to(beNil())
                        expect(response).toNot(beNil())
                    }
                }
                
                it("should have a forecast") {
                    
                }
            }
        }
        
        context("TimeMachine Request"){
            
        }
    }
}
