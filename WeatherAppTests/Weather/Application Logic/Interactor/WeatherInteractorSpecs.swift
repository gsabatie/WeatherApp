//
//  WeatherWeatherInteractorSpecs.swift
//  WeatherApp
//
//  Created by Guillaume on 14/01/2020.
//  Copyright © 2020 gsabatie. All rights reserved.
//

import XCTest
import Quick
import Nimble
import SwiftyMocky
import MapKit

@testable import WeatherApp


final class WeatherInteractorSpecs: QuickSpec {
    
    var interactor: WeatherInteractor!
    var presenterMock: WeatherInteractorOutputProtocolMock!
    
    var dataBaseMock: DatabaseSeriveMock!
    var weatherServiceMock: WeatherServiceMock!
    var addressFinderServiceMock: AddressFinderServiceMock!
    
    override func spec() {
        describe("get Matched Localities from a given text") {
            context("look for text San") {
                self.dataBaseMock = DatabaseSeriveMock.basic
                self.weatherServiceMock = WeatherServiceMock.basic
                self.addressFinderServiceMock = AddressFinderServiceMock.basic
                
                self.interactor =
                    WeatherInteractor(
                        output: WeatherInteractorOutputProtocolMock(),
                        weatherService: self.weatherServiceMock,
                        addressFinderService: self.addressFinderServiceMock,
                        databaseService: self.dataBaseMock)
                
                
                it("should call the adressFinderService") {
                    self.interactor.getMatchedLocalitiesFrom(text: "San") { (localSearhCompletions: [MKLocalSearchCompletion]?, error: Error?) in
                        Verify(self.addressFinderServiceMock, .autoComplete(locality: .value("San"), completion: .any))
                    }
                }
                it("should find several address") {
                    self.interactor.getMatchedLocalitiesFrom(text: "San") { (localSearhCompletions: [MKLocalSearchCompletion]?, error: Error?) in
                        expect(error).to(beNil())
                        expect(localSearhCompletions?.isEmpty) == false
                        expect(localSearhCompletions?.count) >= 1
                        
                    }
                }
                
            }
        }
        
        describe("getLatest Stored Forecast") {
            context("empty database") {
                self.dataBaseMock = DatabaseSeriveMock.basic
                Given(self.dataBaseMock, .getLatestForecast(willReturn: nil))
                
                self.weatherServiceMock = WeatherServiceMock.basic
                self.addressFinderServiceMock = AddressFinderServiceMock.basic
                
                self.interactor =
                    WeatherInteractor(
                        output: WeatherInteractorOutputProtocolMock(),
                        weatherService: self.weatherServiceMock,
                        addressFinderService: self.addressFinderServiceMock,
                        databaseService: self.dataBaseMock)
                
                
                it("should find nothing") {
                    self.interactor.getLatestForecast {
                        (forecast: Forecast?, error: Error?) in
                        expect(forecast).to(beNil())
                        expect(error).to(beNil())
                    }
                }
            }
                context("element storred in database") {
                self.dataBaseMock = DatabaseSeriveMock.basic
                Given(self.dataBaseMock, .getLatestForecast(willReturn: Forecast.mock))
                    
                self.weatherServiceMock = WeatherServiceMock.basic
                self.addressFinderServiceMock = AddressFinderServiceMock.basic
                
                self.interactor =
                    WeatherInteractor(
                        output: WeatherInteractorOutputProtocolMock(),
                        weatherService: self.weatherServiceMock,
                        addressFinderService: self.addressFinderServiceMock,
                        databaseService: self.dataBaseMock)
                
                
                it("should find forecast") {
                    self.interactor.getLatestForecast {
                        (forecast: Forecast?, error: Error?) in
                        expect(forecast?.summary) == Forecast.mock.summary
                        expect(error).to(beNil())
                    }
                }
                
            }
        }
      
    }
}

extension WeatherInteractor {
    static func forTest(presenterMock: inout WeatherInteractorOutputProtocolMock) -> WeatherInteractor  {
        let interactor = WeatherInteractor(output: presenterMock)
        
        return interactor
    }
}

private extension Forecast {
    static var mock: Forecast {
        let date = Date()
        return Forecast(dailyForcastResponse: DailyForecastRequestResponse(time: date.timeIntervalSince1970, summary: "weather test"))
    }
}
private extension DatabaseSeriveMock {
    static var basic: DatabaseSeriveMock {
        return DatabaseSeriveMock()
    }
}

private extension WeatherServiceMock {
    static var basic: WeatherServiceMock {
        return WeatherServiceMock()
    }
}

private extension AddressFinderServiceMock {
    static var basic: AddressFinderServiceMock {
        return AddressFinderServiceMock()
    }
}


fileprivate extension  WeatherUseCaseProtocolMock {
    
}
