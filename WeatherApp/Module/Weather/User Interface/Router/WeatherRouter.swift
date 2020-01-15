//
//  WeatherWeatherRouter.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import Foundation
import UIKit

import StoryboardLoadable

final class WeatherRouter {

}

// MARK:  WeatherRouterProtocol 
extension WeatherRouter: WeatherRouterProtocol {
     func present(from viewController:UIViewController) {
        let weatherViewController =  UIStoryboard.loadViewController() as WeatherViewController
        viewController.present(weatherViewController, animated: true, completion: nil)
     }
}
