//
//  AddressConverter.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 16/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit


/// Struct convert an address to  longitude and latitude
final class AddressConverter: NSObject {
    
    let coder: CLGeocoder = CLGeocoder()
    
    var searchCompleter = MKLocalSearchCompleter()
    
    private var autocompleteBlock: AutoCompletionBlock?
    
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
    
    
    func locationfrom(
        localSearchCompletion: MKLocalSearchCompletion,
        completion: @escaping (_ location: CLLocation?, _ error: Error?) -> ())
    {
        let request = MKLocalSearch.Request(completion: localSearchCompletion)
        let search = MKLocalSearch(request: request)
        search.start { (response: MKLocalSearch.Response?, error: Error?) in
            if let error = error {
                completion(nil, error)
            }
            else if let mapItems = response?.mapItems {
                completion(mapItems.first?.placemark.location, nil)
            }
        }
    }
    
    /// Function find the localities associated with the given string
    /// - Parameters:
    ///   - locality: String to look for
    ///   - completion: (_ addresses: [String]?, _ error: Error?)
    func autoComplete(
        locality: String,
        completion: @escaping (_ addresses: [MKLocalSearchCompletion]?, _ error: Error?) -> ()) {
        
        searchCompleter.delegate = self
        
        searchCompleter.resultTypes = .address
        searchCompleter.queryFragment = locality
        self.autocompleteBlock = completion
    }
}

extension AddressConverter: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        if  let completion = self.autocompleteBlock {
            completion(completer.results, nil)
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        if  let completion = self.autocompleteBlock {
            completion(nil, error)
        }
    }
}
