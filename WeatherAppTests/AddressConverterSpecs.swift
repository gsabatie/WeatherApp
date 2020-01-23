//
//  AddressConverterSpecs.swift
//  WeatherAppTests
//
//  Created by guillaume sabatié on 16/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import Quick
import Nimble
import CoreLocation
import MapKit


@testable import WeatherApp

final class AddressConverterSpecs: QuickSpec {
    private var addressConverter: MapKitAddressFinderService!
    override func spec() {
        
        describe("Convert formatted address to longitude latitude") {
            
            
            context("with Lyon address") {
                self.addressConverter = MapKitAddressFinderService()
                it("should convert the address") {
                    self.addressConverter.searchLocationFrom(address: "Lyon") {
                        (location: CLLocation?, error: Error?) in
                        expect(location).notTo(beNil())
                        expect(location?.coordinate.latitude) ==  45.7672789
                        expect(location?.coordinate.longitude) ==  4.8343548
                        expect(error).to(beNil())
                    }
                }
            }
        }
        
        describe("Search closest Locality from Location") {
            context("with location city Lyon") {
                self.addressConverter = MapKitAddressFinderService()
                let lyonLocation: CLLocation
                    = CLLocation(latitude: 45.75801, longitude: 4.8001016)
                it("should find Lyon") {
                    self.addressConverter.searchLocalityFrom(location: lyonLocation) { (localityName: String?, error: Error?) in
                        expect(localityName) == "Lyon"
                        expect(error).to(beNil())
                    }
                }
            }
        }
        
        describe("AutoComplete a locality name") {
            context("with San as text") {
                self.addressConverter = MapKitAddressFinderService()
                
                it("should convert the address") {
                    self.addressConverter.autoComplete(locality: "San") { (localSearhCompletions: [MKLocalSearchCompletion]?, error: Error?) in
                        expect(error).to(beNil())
                        expect(localSearhCompletions?.isEmpty) == false
                        expect(localSearhCompletions?.count) >= 1
                        
                    }
                }
            }
        }
    }
}
