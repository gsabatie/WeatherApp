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

@testable import WeatherApp

final class AddressConverterSpecs: QuickSpec {
    private var addressConverter: AddressConverter!
    override func spec() {
        
        describe("Convert formatted address to longitude latitude") {
         
            
            context("with Lyon as address") {
                self.addressConverter = AddressConverter()
                it("should convert the address") {
                    self.addressConverter.convert(address: "Lyon") {
                        (coordinate: CLLocationCoordinate2D?, error: Error?) in
                        expect(coordinate).notTo(beNil())
                        expect(coordinate?.latitude) ==  45.7672789
                         expect(coordinate?.longitude) ==  4.8343548
                        expect(error).to(beNil())
                    }
                }
            }
        }
        describe("AutoComplete a locality name") {
            
        }
    }
}
