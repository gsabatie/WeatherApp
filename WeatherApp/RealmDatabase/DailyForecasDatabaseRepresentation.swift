//
//  DailyForecasDatabaseRepresentation.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 20/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import RealmSwift

final class DailyForecasDatabaseRepresentation: Object {
    @objc dynamic var date: Date = Date()
    @objc dynamic var summary: String = ""
    @objc dynamic var minTemperature: Float = 0
    @objc dynamic var maxTemperature: Float = 0
    
    init(dailyForecast: Forecast) {
        self.date = dailyForecast.date
        
        self.summary = dailyForecast.summary
        self.minTemperature = dailyForecast.minTemperature
        self.maxTemperature = dailyForecast.maxTemperature
    }
    
    required init() {
        self.date = Date()
        self.summary = ""
        self.minTemperature = 0
        self.maxTemperature = 0
    }
}
