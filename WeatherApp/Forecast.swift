//
//  Forecast.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 17/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import CoreLocation
import RealmSwift

class Forecast {
    var date: NSDate = NSDate()
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
     var locality: String?
    var summary: String = ""
    var minTemperature: Float = 0
   var maxTemperature: Float = 0
    var currentTemperature: Float = 0
    
    var nextHourlyForecasts: [Forecast] = [Forecast]()
    var nextDailyForecasts: [Forecast] = [Forecast]()
 
    
    init(request: ForecastRequestResponse) {
        self.location =
            CLLocationCoordinate2D(latitude: request.latitude, longitude: request.longitude)
        self.currentTemperature = request.currently.temperature
        self.summary = request.currently.summary
        
    }
    
}
