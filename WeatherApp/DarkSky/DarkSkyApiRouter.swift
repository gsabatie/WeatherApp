//
//  DarkSkyApiRouter.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 14/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import Alamofire

enum DarkSkyAPIRouter: URLRequestConvertible {
    static let baseURLString = "https://api.darksky.net"
    
    case forecast(secret: String, latitude: Double, longitude: Double, time: TimeInterval?)
    
    func asURLRequest() throws -> URLRequest {
        let path: String = {
            switch self {
            case let .forecast(secret, latitude, longitude, time):
                var path = "/forecast/\(secret)/\(latitude)/\(longitude)"
                if let time: TimeInterval = time  {
                 path += ", \(time)"
                }
                return path
            }
        }()
        
        let url = try DarkSkyAPIRouter.baseURLString.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }
}
