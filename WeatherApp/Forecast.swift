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
    var locality: String = ""
    var summary: String = ""
    var minTemperature: Float = 0
    var maxTemperature: Float = 0
    var currentTemperature: Float = 0
    
    var nextHourlyForecasts: [Forecast]?
    var nextDailyForecasts: [Forecast]?
    
    init(dailyForcastResponse: DailyForecast) {
        self.date = Date(timeIntervalSince1970: dailyForcastResponse.time)
        self.summary = dailyForcastResponse.summary
        self.minTemperature = dailyForcastResponse.temperatureMin
        self.maxTemperature = dailyForcastResponse.temperatureMax
    }
    
    init(request: ForecastRequestResponse) {
        self.location =
            CLLocationCoordinate2D(latitude: request.latitude, longitude: request.longitude)
        self.currentTemperature = request.currently.temperature
        self.summary = request.currently.summary
        
        self.nextDailyForecasts =
            request.daily?.compactMap {
            let dailyforecast:Forecast = Forecast(dailyForcastResponse: $0)
            return dailyforecast
        }
    }
    
    init(dailyForecastFromDB: DailyForecasDatabaseRepresentation) {
         self.date = dailyForecastFromDB.date
              
               self.summary = dailyForecastFromDB.summary
               self.minTemperature = dailyForecastFromDB.minTemperature
               self.maxTemperature = dailyForecastFromDB.maxTemperature
    }
    
    init(forecastFromDB: ForecasDatabaseRepresentation) {
        self.date = forecastFromDB.date
        self.location =
            CLLocationCoordinate2D(
                latitude: forecastFromDB.latitude,
                longitude: forecastFromDB.longitude)
        self.locality = forecastFromDB.locality
        self.summary = forecastFromDB.summary
        self.currentTemperature = forecastFromDB.currentTemperature
        
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
