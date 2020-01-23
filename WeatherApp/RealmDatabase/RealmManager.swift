//
//  RealmManager.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 20/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import Foundation
import RealmSwift
import EasyOSLogger

//sourcery: AutoMockable
protocol DatabaseSerive {
     func save(forecast: Forecast)
       func getLatestForecast() -> Forecast?
}

struct RealmManager: DatabaseSerive {
    
    var realm: Realm? {
        do {
            return try Realm()
        } catch let error {
            Log.error(error.localizedDescription)
            return nil
        }
        
    }
    
    func save(forecast: Forecast) {
        let forecastDB = ForecasDatabaseRepresentation(forecast: forecast)
        guard let realm: Realm = self.realm else { return }
        
        try? realm.write {
            realm.deleteAll()
            realm.add(forecastDB)
            
        }
    }
    
    func getLatestForecast() -> Forecast? {
         guard let realm: Realm = self.realm else { return nil }
        if let latestForecast: ForecasDatabaseRepresentation =
            realm.objects(ForecasDatabaseRepresentation.self)
                .sorted(byKeyPath: "date")
                .first
        {
            return Forecast(forecastFromDB: latestForecast)
        }
        return nil
    }
}
