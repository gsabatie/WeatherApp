//
//  WeatherWeatherConfigurator.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import UIKit

final class WeatherModuleConfigurator {

    static func initializePresenter() -> WeatherPresenter {
          var view: WeatherViewProtocol!

          let router = WeatherRouter()
//          if #available(iOS 13.0.0, *) {
//              view = WeatherView()
//          } else {
              view =  WeatherViewController()
//          }
        
          let presenter = WeatherPresenter(router: router, view: view)
          let interactor = WeatherInteractor(output:presenter)

          presenter.interactor = interactor
          view.output = presenter
          return presenter
    }

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? WeatherViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController:WeatherViewController) {
        let router = WeatherRouter()
        let presenter = WeatherPresenter(router: router, view: viewController)
        let interactor = WeatherInteractor(output:presenter)

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
