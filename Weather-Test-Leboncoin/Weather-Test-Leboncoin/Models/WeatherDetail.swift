//
//  WeatherDetail.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class WeatherDetailModel {
    
    private let _date: String!
    private let _temperature: Double!
    private let _pluie: Double!
    private let _humidite: Double!
    private let _pression: Double!
    private let _vent: Double!
    private let _neige: String!
    
    init(date: String, temperature: Double, pluie: Double, humidite: Double, pression: Double, vent: Double, neige: String) {
        _date = date
        _temperature = temperature
        _pluie = pluie
        _humidite = humidite
        _pression = pression
        _vent = vent
        _neige = neige
    }
    
    
    
    func getDate() -> String { return _date }
    func getTemperature() -> Int { return Int(_temperature) }
    func getPluie() -> Double { return _pluie }
    func getHumidite() -> Double { return _humidite }
    func getPression() -> Double { return _pression }
    func getVent() -> Double { return _vent }
    func getNeige() -> String { return _neige }
    
}
