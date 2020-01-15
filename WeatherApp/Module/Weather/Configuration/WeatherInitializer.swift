//
//  WeatherWeatherInitializer.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit

final class WeatherModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var weatherViewController: WeatherViewController!

    override func awakeFromNib() {

        let configurator = WeatherModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: weatherViewController)
    }

}
