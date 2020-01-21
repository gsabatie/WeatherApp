//
//  AddressConverter.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 16/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import CoreLocation


/// Struct convert an address to  longitude and latitude
struct AddressConverter {
    
    let coder: CLGeocoder = CLGeocoder()
    
    func convert(
        address: String,
        completion: @escaping (_ location: CLLocation?, _ error: Error?) -> ()) {
        self.coder.geocodeAddressString(address) {
            (placemarks, error) -> Void in
            guard let placemarks: [CLPlacemark] = placemarks, let placemark = placemarks.first  else {
                completion(nil, error)
                return
            }
            
            completion(placemark.location, nil)
        }
    }
    
    /// Function find the name of the locality at the given location
    /// - Parameters:
    ///   - location: CLLocation to use to find the locality
    ///   - completion: (_ addresse: String?, _ error: Error?)
    func name(
        location: CLLocation,
        completion: @escaping (_ addresse: String?, _ error: Error?) -> ()) {
        self.coder.reverseGeocodeLocation(location) {
            (placemarks: [CLPlacemark]?, error: Error?) in
            guard let placemarks: [CLPlacemark]  = placemarks else {
                completion(nil, error)
                return
            }
            
            let localities: [String] = placemarks.compactMap { $0.locality }
            
            completion(localities.first, nil)
        }
    }
    
    
    /// Function find the localities associated with the given string
    /// - Parameters:
    ///   - locality: String to look for
    ///   - completion: (_ addresses: [String]?, _ error: Error?)
    func autoComplete(
        locality: String,
        completion: @escaping (_ addresses: [String]?, _ error: Error?) -> ()) {
        self.coder.geocodeAddressString(locality) {
            (placemarks: [CLPlacemark]?, error: Error?) in
            guard let placemarks: [CLPlacemark]  = placemarks else {
                completion(nil, error)
                return
            }
            
            let localities: [String] = placemarks.compactMap { $0.locality }
            
            completion(localities, nil)
        }
    }
}
