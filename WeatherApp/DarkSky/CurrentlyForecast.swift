//
//  CurrentlyForecast.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 14/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation

struct CurrentlyForecast {
    var time: TimeInterval
    var summary: String
    var icon: String
    var nearestStormDistance: Float
    var precipIntensity: Double
    var precipIntensityError: Double
    var precipProbability: Float
    var precipType: String
    var temperature: Float
    var apparentTemperature: Float
    var dewPoint: Float
    var humidity: Float
    var pressure: Float
    var windSpeed: Float
    var windGust: Float
    var windBearing: Int
    var cloudCover: Float
    var uvIndex: Float
    var visibility: Float
    var ozone: Float
}


// MARK: - Extension Decodable
extension CurrentlyForecast: Decodable {
    enum keys: String, CodingKey {
        case time = "time"
        case summary = "summary"
        case icon = "icon"
        case nearestStormDistance = "nearestStormDistance"
        case precipIntensity = "precipIntensity"
        case precipIntensityError = "precipIntensityError"
        case precipProbability = "precipProbability"
        case precipType = "precipType"
        case temperature = "temperature"
        case apparentTemperature = "apparentTemperature"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case pressure = "pressure"
        case windSpeed = "windSpeed"
        case windGust = "windGust"
        case windBearing = "windBearing"
        case cloudCover = "cloudCover"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case ozone = "ozone"
    }
       
       init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: keys.self)
        let time: TimeInterval = try container.decode(Double.self, forKey: .time)
        let summary: String = try container.decode(String.self, forKey: .summary)
        let icon: String = try container.decode(String.self, forKey: .icon)
        let nearestStormDistance: Float = try container.decode(Float.self, forKey: .nearestStormDistance)
        let precipIntensity: Double = try container.decode(Double.self, forKey: .precipIntensity)
        let precipIntensityError: Double = try container.decode(Double.self, forKey: .precipIntensityError)
        let precipProbability: Float = try container.decode(Float.self, forKey: .precipProbability)
        let precipType: String = try container.decode(String.self, forKey: .precipType)
        let temperature: Float = try container.decode(Float.self, forKey: .temperature)
        let apparentTemperature: Float = try container.decode(Float.self, forKey: .apparentTemperature)
        let dewPoint: Float = try container.decode(Float.self, forKey: .dewPoint)
        let humidity: Float = try container.decode(Float.self, forKey: .humidity)
        let pressure: Float = try container.decode(Float.self, forKey: .pressure)
        let windSpeed: Float = try container.decode(Float.self, forKey: .windSpeed)
        let windGust: Float = try container.decode(Float.self, forKey: .windGust)
        let windBearing: Int = try container.decode(Int.self, forKey: .windBearing)
        let cloudCover: Float = try container.decode(Float.self, forKey: .cloudCover)
        let uvIndex: Float = try container.decode(Float.self, forKey: .uvIndex)
        let visibility: Float = try container.decode(Float.self, forKey: .visibility)
        let ozone: Float = try container.decode(Float.self, forKey: .ozone)
        
        self.init(
            time: time,
            summary: summary,
            icon: icon,
            nearestStormDistance: nearestStormDistance,
            precipIntensity: precipIntensity,
            precipIntensityError: precipIntensityError,
            precipProbability: precipProbability,
            precipType: precipType,
            temperature: temperature,
            apparentTemperature: apparentTemperature,
            dewPoint: dewPoint,
            humidity: humidity,
            pressure: pressure,
            windSpeed: windSpeed,
            windGust: windGust,
            windBearing: windBearing,
            cloudCover: cloudCover,
            uvIndex: uvIndex,
            visibility: visibility,
            ozone: ozone)
       }
}

