//
//  ForecastInfos.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 23/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation

struct ForecastInfo {
    var iconName: String
    var value: String
    var title: String
    
    static func transform(forecast: Forecast) -> [ForecastInfo] {
        var forecastInfos: [ForecastInfo] = [ForecastInfo]()
        if let humidity: Float = forecast.humidity {
            forecastInfos
                .append(
                    ForecastInfo(iconName: "humidity", value: "\(humidity)", title: "humidity"))
        }
        if let dewPoint: Float = forecast.dewPoint {
            forecastInfos
                .append(ForecastInfo(iconName: "dew",value: "\(dewPoint)", title: "dewPoint"))
        }
        if let apparentTemperature: Float = forecast.apparentTemperature {
            forecastInfos
                .append(
                    ForecastInfo(
                        iconName: "temperature",
                        value: "\(apparentTemperature)",
                        title: "apparent"))
        }
        if let pressure: Float = forecast.pressure {
            forecastInfos
                .append(
                    ForecastInfo(iconName: "pressure", value: "\(pressure)", title: "pressure"))
        }
        if let ozone: Float = forecast.ozone {
            forecastInfos
                .append(ForecastInfo(iconName: "ozone", value: "\(ozone)", title: "ozone"))
        }
        if let visibility: Float = forecast.pressure {
            forecastInfos
                .append(
                    ForecastInfo(
                        iconName: "visibility",value: "\(visibility)", title: "visibility"))
        }
        return forecastInfos
    }
}
