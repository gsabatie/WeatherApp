//
//  HourlyForecast.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 16/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation

struct DailyForecast {
    var time: TimeInterval
    var summary: String
    var icon: String
    var sunriseTime: TimeInterval
    var sunsetTime: TimeInterval
    var moonPhase: Float
    var precipIntensity: Float?
    var precipIntensityError: Double?
    var precipType: String?
    var precipIntensityMax: Float
    var precipIntensityMaxTime: TimeInterval
    var precipProbability: Float
    var nearestStormDistance: Float?
    
    
    var temperatureHigh: Float
    var temperatureHighTime: TimeInterval
    var temperatureLow: Float
    var temperatureLowTime: TimeInterval
    
    
    var temperatureMin: Float
    var temperatureMinTime: TimeInterval
    var temperatureMax: Float
    var temperatureMaxTime: TimeInterval
    var apparentTemperatureMin: Float
    var apparentTemperatureMinTime: TimeInterval
    var apparentTemperatureMax: Float
    var apparentTemperatureMaxTime: TimeInterval
    var apparentTemperatureHigh: Float
    var apparentTemperatureHighTime: TimeInterval
    var apparentTemperatureLow: Float
    var apparentTemperatureLowTime: TimeInterval
}


extension DailyForecast: Decodable {
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
        
        case sunriseTime = "sunriseTime"
        case sunsetTime = "sunsetTime"
        case moonPhase = "moonPhase"
        
        case precipIntensityMax = "precipIntensityMax"
        case precipIntensityMaxTime = "precipIntensityMaxTime"
        
        
        
        case temperatureHigh = "temperatureHigh"
        case temperatureHighTime = "temperatureHighTime"
        case temperatureLow = "temperatureLow"
        case temperatureLowTime = "temperatureLowTime"
        
        
        case temperatureMin = "temperatureMin"
        case temperatureMinTime = "temperatureMinTime"
        case temperatureMax = "temperatureMax"
        case temperatureMaxTime = "temperatureMaxTime"
        case apparentTemperatureMin = "apparentTemperatureMin"
        case apparentTemperatureMinTime = "apparentTemperatureMinTime"
        case apparentTemperatureMax = "apparentTemperatureMax"
        case apparentTemperatureMaxTime = "apparentTemperatureMaxTime"
        case apparentTemperatureHigh = "apparentTemperatureHigh"
        case apparentTemperatureHighTime = "apparentTemperatureHighTime"
        case apparentTemperatureLow = "apparentTemperatureLow"
        case apparentTemperatureLowTime = "apparentTemperatureLowTime"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        
        let time: TimeInterval = try container.decode(Double.self, forKey: .time)
        let summary: String = try container.decode(String.self, forKey: .summary)
        let icon: String = try container.decode(String.self, forKey: .icon)
        let sunriseTime: TimeInterval = try container.decode(Double.self, forKey: .sunsetTime)
        let sunsetTime: TimeInterval = try container.decode(Double.self, forKey: .sunsetTime)
        let moonPhase: Float = try container.decode(Float.self, forKey: .moonPhase)
        let precipIntensity: Float? = try? container.decode(Float.self, forKey: .precipIntensity)
        let precipIntensityError: Double?  = try? container.decode(Double.self, forKey: .precipIntensityError)
        let precipType: String? = try? container.decode(String.self, forKey: .precipType)
        let precipIntensityMax: Float = try container.decode(Float.self, forKey: .precipIntensityMax)
        let precipIntensityMaxTime: TimeInterval = try container.decode(Double.self, forKey: .precipIntensityMaxTime)
        let precipProbability: Float = try container.decode(Float.self, forKey: .precipProbability)
        let nearestStormDistance: Float? = try? container.decode(Float.self, forKey: .nearestStormDistance)
        
        
        let temperatureHigh: Float = try container.decode(Float.self, forKey: .temperatureHigh)
        let temperatureHighTime: TimeInterval = try container.decode(Double.self, forKey: .temperatureHighTime)
        let temperatureLow: Float = try container.decode(Float.self, forKey: .temperatureLow)
        let temperatureLowTime: TimeInterval = try container.decode(Double.self, forKey: .temperatureLowTime)
        
        
        let temperatureMin: Float = try container.decode(Float.self, forKey: .temperatureMin)
        let temperatureMinTime: TimeInterval = try container.decode(Double.self, forKey: .temperatureMinTime)
        let temperatureMax: Float = try container.decode(Float.self, forKey: .temperatureMax)
        let temperatureMaxTime: TimeInterval = try container.decode(Double.self, forKey: .temperatureMaxTime)
        let apparentTemperatureMin: Float = try container.decode(Float.self, forKey: .apparentTemperatureMin)
        let apparentTemperatureMinTime: TimeInterval = try container.decode(Double.self, forKey: .apparentTemperatureMinTime)
        let apparentTemperatureMax: Float = try container.decode(Float.self, forKey: .apparentTemperatureMax)
        let apparentTemperatureMaxTime: TimeInterval = try container.decode(Double.self, forKey: .apparentTemperatureMaxTime)
        let apparentTemperatureHigh: Float = try container.decode(Float.self, forKey: .apparentTemperatureHigh)
        let apparentTemperatureHighTime: TimeInterval = try container.decode(Double.self, forKey: .apparentTemperatureHighTime)
        let apparentTemperatureLow: Float = try container.decode(Float.self, forKey: .apparentTemperatureLow)
        let apparentTemperatureLowTime: TimeInterval = try container.decode(Double.self, forKey: .apparentTemperatureLowTime)
        
        self.init(
            time: time,
            summary: summary,
            icon: icon,
            sunriseTime: sunriseTime,
            sunsetTime: sunsetTime,
            moonPhase: moonPhase,
            precipIntensity: precipIntensity,
            precipIntensityError: precipIntensityError,
            precipType: precipType,
            precipIntensityMax: precipIntensityMax,
            precipIntensityMaxTime: precipIntensityMaxTime,
            precipProbability: precipProbability,
            nearestStormDistance: nearestStormDistance,
            
            temperatureHigh: temperatureHigh,
            temperatureHighTime: temperatureHighTime,
            temperatureLow: temperatureLow,
            temperatureLowTime: temperatureLowTime,
            temperatureMin: temperatureMin,
            temperatureMinTime: temperatureMinTime,
            temperatureMax: temperatureMax,
            temperatureMaxTime: temperatureMaxTime,
            apparentTemperatureMin: apparentTemperatureMin,
            apparentTemperatureMinTime: apparentTemperatureMinTime,
            apparentTemperatureMax: apparentTemperatureMax,
            apparentTemperatureMaxTime: apparentTemperatureMaxTime,
            apparentTemperatureHigh: apparentTemperatureHigh,
            apparentTemperatureHighTime: apparentTemperatureHighTime,
            apparentTemperatureLow: apparentTemperatureLow,
            apparentTemperatureLowTime: apparentTemperatureLowTime)
    }
}

