//
//  ForecasDatabaseRepresentation.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 20/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import RealmSwift

final class ForecasDatabaseRepresentation: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var longitude: Double = 0.0
     @objc dynamic var latitude: Double = 0.0
    
    @objc dynamic  var locality: String = ""
    @objc dynamic var summary: String = ""

    @objc dynamic var currentTemperature: Float = 0
    
    var nextHourlyForecasts: List<DailyForecasDatabaseRepresentation> =
        List<DailyForecasDatabaseRepresentation>()
    var nextDailyForecasts: List<DailyForecasDatabaseRepresentation> =
        List<DailyForecasDatabaseRepresentation>()
    
    init(forecast: Forecast) {
        super.init()
        self.date = forecast.date
        self.longitude = forecast.location.longitude
        self.latitude = forecast.location.latitude
        self.locality = forecast.locality
        self.summary = forecast.summary
        self.currentTemperature = forecast.currentTemperature
        

        forecast.nextDailyForecasts?.forEach {
            self.nextDailyForecasts
                .append(DailyForecasDatabaseRepresentation(dailyForecast: $0))
        }

        forecast.nextHourlyForecasts?.forEach {
            self.nextHourlyForecasts
                .append(DailyForecasDatabaseRepresentation(dailyForecast: $0))
        }
    }
    
     required init() {
        self.date = Date()
        self.longitude = 0
        self.latitude = 0
        self.locality = ""
        self.summary = ""
        self.currentTemperature = 0
        
        self.nextDailyForecasts = List<DailyForecasDatabaseRepresentation>()
        self.nextHourlyForecasts = List<DailyForecasDatabaseRepresentation>()

    }
}
