//
//  PrevisionJsonParse.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/8/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class PrevisionJsonParse {
    
    static let shared = PrevisionJsonParse()
    
    func parse(prevesion json: NSDictionary) -> [WeatherDetail] {
        var weatherDetails = [WeatherDetail]()
        for key in json.allKeys {
            if let prevision = json[key] as? NSDictionary {
                let tempDictionary = prevision["temperature"] as! NSDictionary
                let pressionDictionary = prevision["pression"] as! NSDictionary
                let ventDictionary = prevision["vent_moyen"] as! NSDictionary
                let humiditeDictionary = prevision["humidite"] as! NSDictionary
                let date = key as! String
                let pluie = prevision["pluie"] as! Double
                let neige = prevision["risque_neige"] as! String
                let temperature = tempDictionary["2m"] as! Double
                let pression = pressionDictionary["niveau_de_la_mer"] as! Double
                let vent = ventDictionary["10m"] as! Double
                let humidite = humiditeDictionary["2m"] as! Double
                
                let weatherDetail = WeatherDetail(date: date, temperature: temperature, pluie: pluie, humidite: humidite, pression: pression, vent: vent, neige: neige)
                weatherDetails.append(weatherDetail)
            }
        }
        
        return weatherDetails
    }
    
}
