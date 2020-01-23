//
//  Forecast.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 17/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import CoreLocation

struct Forecast {
    var date: Date = Date()
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var locality: String?
    var summary: String?
    var minTemperature: Float?
    var maxTemperature: Float?
    var currentTemperature: Float?
    var apparentTemperature: Float?
    
    var dewPoint: Float?
    var humidity: Float?
    var pressure: Float?
    var windSpeed: Float?
    var windGust: Float?
    var windBearing: Int?
    var cloudCover: Float?
    var uvIndex: Float?
    var visibility: Float?
    var ozone: Float?
    
    var iconName: String?
    
    var nextHourlyForecasts: [Forecast]?
    var nextDailyForecasts: [Forecast]?
    
    init(dailyForcastResponse: DailyForecastRequestResponse) {
        self.date = Date(timeIntervalSince1970: dailyForcastResponse.time)
        self.summary = dailyForcastResponse.summary
        self.minTemperature = dailyForcastResponse.temperatureMin
        self.maxTemperature = dailyForcastResponse.temperatureMax
        self.iconName = dailyForcastResponse.icon
    }
    
    init(forecastRequestResponse: ForecastRequestResponse) {
        self.location =
            CLLocationCoordinate2D(latitude: forecastRequestResponse.latitude, longitude: forecastRequestResponse.longitude)
        self.currentTemperature = forecastRequestResponse.currently.temperature
        self.summary = forecastRequestResponse.currently.summary
        
        self.apparentTemperature = forecastRequestResponse.currently.apparentTemperature
        self.dewPoint = forecastRequestResponse.currently.dewPoint
        self.humidity = forecastRequestResponse.currently.humidity
        self.pressure = forecastRequestResponse.currently.pressure
        self.windSpeed = forecastRequestResponse.currently.windSpeed
        self.windGust = forecastRequestResponse.currently.windGust
        self.windBearing = forecastRequestResponse.currently.windBearing
        self.cloudCover = forecastRequestResponse.currently.cloudCover
        self.uvIndex = forecastRequestResponse.currently.uvIndex
        self.visibility = forecastRequestResponse.currently.visibility
        self.ozone = forecastRequestResponse.currently.ozone
        
        self.nextDailyForecasts =
            forecastRequestResponse.daily?.compactMap {
                let dailyforecast:Forecast = Forecast(dailyForcastResponse: $0)
                return dailyforecast
        }
    }
    
    init(dailyForecastFromDB: DailyForecasDatabaseRepresentation) {
        self.date = dailyForecastFromDB.date
        
        self.summary = dailyForecastFromDB.summary
        self.minTemperature = dailyForecastFromDB.minTemperature.value
        self.maxTemperature = dailyForecastFromDB.maxTemperature.value
        self.iconName = dailyForecastFromDB.iconName
    }
    
    init(forecastFromDB: ForecasDatabaseRepresentation) {
        self.date = forecastFromDB.date
        self.location =
            CLLocationCoordinate2D(
                latitude: forecastFromDB.latitude,
                longitude: forecastFromDB.longitude)
        self.locality = forecastFromDB.locality
        self.summary = forecastFromDB.summary
        self.currentTemperature = forecastFromDB.currentTemperature.value
        
        if !forecastFromDB.nextDailyForecasts.isEmpty {
            self.nextDailyForecasts = [Forecast]()
            forecastFromDB.nextDailyForecasts.forEach {
                self.nextDailyForecasts?.append(Forecast(dailyForecastFromDB: $0))
            }
        }
        if !forecastFromDB.nextHourlyForecasts.isEmpty {
            self.nextHourlyForecasts = [Forecast]()
            forecastFromDB.nextHourlyForecasts.forEach {
                self.nextHourlyForecasts?.append(Forecast(dailyForecastFromDB: $0))
            }
        }
    }
    
}
