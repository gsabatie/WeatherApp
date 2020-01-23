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
    
    let apparentTemperature:  RealmOptional<Float>
    let dewPoint: RealmOptional<Float>
    let humidity: RealmOptional<Float>
    let pressure: RealmOptional<Float>
    let windSpeed: RealmOptional<Float>
    let windGust: RealmOptional<Float>
    let windBearing: RealmOptional<Int>
    let cloudCover: RealmOptional<Float>
    let uvIndex: RealmOptional<Float>
    let visibility: RealmOptional<Float>
    let ozone: RealmOptional<Float>
    
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
        
        self.apparentTemperature.value = forecast.apparentTemperature
        self.dewPoint.value = forecast.dewPoint
        self.humidity.value = forecast.humidity
        self.pressure.value = forecast.pressure
        self.windSpeed.value = forecast.windSpeed
        self.windGust.value = forecast.windGust
        self.windBearing.value = forecast.windBearing
        self.cloudCover.value = forecast.cloudCover
        self.uvIndex.value = forecast.uvIndex
        self.visibility.value = forecast.visibility
        self.ozone.value = forecast.ozone
        
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
        self.apparentTemperature = RealmOptional<Float>()
        self.dewPoint = RealmOptional<Float>()
        self.humidity = RealmOptional<Float>()
        self.pressure = RealmOptional<Float>()
        self.windSpeed = RealmOptional<Float>()
        self.windGust = RealmOptional<Float>()
        self.windBearing = RealmOptional<Int>()
        self.cloudCover = RealmOptional<Float>()
        self.uvIndex = RealmOptional<Float>()
        self.visibility = RealmOptional<Float>()
        self.ozone = RealmOptional<Float>()
        
        
        self.nextDailyForecasts = List<DailyForecasDatabaseRepresentation>()
        self.nextHourlyForecasts = List<DailyForecasDatabaseRepresentation>()
        
    }
}
