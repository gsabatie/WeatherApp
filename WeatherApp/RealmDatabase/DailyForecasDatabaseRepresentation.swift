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
    @objc dynamic var date: Date
    @objc dynamic var summary: String?
    
    let minTemperature:  RealmOptional<Float>
    let maxTemperature:  RealmOptional<Float>
    
    @objc dynamic var iconName: String?
    
    init(dailyForecast: Forecast) {
        self.date = dailyForecast.date
        
        self.summary = dailyForecast.summary
        self.minTemperature = RealmOptional<Float>(dailyForecast.minTemperature)
        self.maxTemperature =  RealmOptional<Float>(dailyForecast.maxTemperature)
        self.iconName = dailyForecast.iconName
    }
    
    required init() {
        self.date = Date()
        self.minTemperature = RealmOptional<Float>()
        self.maxTemperature = RealmOptional<Float>()
    }
}
