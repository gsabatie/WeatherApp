//
//  ForecastRequestResponse.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 16/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation


struct ForecastRequestResponse {
    
    var latitude: Double
    var longitude: Double
    var timezone: String
    
    var currently: CurrentlyForecast
}

// MARK: - Extension Decodable
extension ForecastRequestResponse:  Decodable {
    enum keys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case timezone = "timezone"
        
        case currently = "currently"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let latitude: Double = try container.decode(Double.self, forKey: .latitude)
        let longitude: Double = try container.decode(Double.self, forKey: .longitude)
        let timezone: String = try container.decode(String.self, forKey: .timezone)
        
        let currently: CurrentlyForecast = try container.decode(CurrentlyForecast.self, forKey: .currently)
        
        self.init(
            latitude: latitude,
            longitude: longitude,
            timezone: timezone,
            currently: currently)
    }
}

