//
//  DarkSkyAPI.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 14/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import CoreLocation
import Foundation
import EasyOSLogger

import Alamofire

//sourcery: AutoMockable
protocol WeatherService {
    func getForecast(
        location: CLLocation,
        time: Date?,
        completion: @escaping (_ response: ForecastRequestResponse?, _ error: Error?) -> ()
    )
}


/// Struct to wrap the DarkSky Api https://darksky.net/dev/docs#overview
struct DarkSkyService: WeatherService {
    
    private var secret: String = "9d5bedc2cb85f28bb204dd982cacac41"
    
    func getForecast(
        location: CLLocation,
        time: Date?,
        completion: @escaping (_ response: ForecastRequestResponse?, _ error: Error?) -> ()
    ) {
        Alamofire
            .request(
                DarkSkyAPIRouter
                    .forecast(
                        secret: self.secret,
                        latitude: location.coordinate.latitude,
                        longitude: location.coordinate.longitude,
                        time: time?.timeIntervalSince1970))
            .responseJSON { (response: DataResponse<Any>) in
                Log.debug(response.debugDescription, category: .network)
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let requestResponse =
                                try JSONDecoder().decode(ForecastRequestResponse.self, from: data)
                            completion(requestResponse, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    }
                case .failure(let error):
                    completion(nil, error)
                }
                
        }
    }
}
