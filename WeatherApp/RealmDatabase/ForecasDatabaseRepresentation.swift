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
    @objc dynamic var date: Date
    @objc dynamic var longitude: Double
    @objc dynamic var latitude: Double
    
    @objc dynamic  var locality: String?
    @objc dynamic var summary: String?
    
    let currentTemperature: RealmOptional<Float>
    
    var nextHourlyForecasts: List<DailyForecasDatabaseRepresentation>
    var nextDailyForecasts: List<DailyForecasDatabaseRepresentation>
    
    convenience init(forecast: Forecast) {
        self.init()
        self.date = forecast.date
        self.longitude = forecast.location.longitude
        self.latitude = forecast.location.latitude
        self.locality = forecast.locality
        self.summary = forecast.summary
        self.currentTemperature.value = forecast.currentTemperature
        
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
        self.currentTemperature = RealmOptional<Float>()
        
        self.nextDailyForecasts = List<DailyForecasDatabaseRepresentation>()
        self.nextHourlyForecasts = List<DailyForecasDatabaseRepresentation>()
        
    }
}
