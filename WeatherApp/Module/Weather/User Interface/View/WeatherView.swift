//
//  WeatherWeatherView.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
final class WeatherView: View {

   // MARK: Dependency inversion variable 
   var output: WeatherViewEventResponderProtocol?

   // MARK: Instance variable

    var body: some View {
        Text("hello world")
   }
}

// MARK: MeSwiftViewProtocol
@available(iOS 13.0.0, *)
extension WeatherView: WeatherViewProtocol {

}


#if DEBUG
@available(iOS 13.0.0, *)
struct WeatherView_Previews: PreviewProvider {
   static var previews: some View {
       ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
           WeatherView()
               .previewDevice(PreviewDevice(rawValue: deviceName))
               .previewDisplayName(deviceName)
       }
   }
}
#endif
