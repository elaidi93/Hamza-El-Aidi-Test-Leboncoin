//
//  WeatherDetailViewModel.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class WeatherDetailViewModel {
    
    private var previsionList: [WeatherDetailModel]!
    let formatter = DateFormatter()
    
    var date: String!
    var time: String!
    
    
    init(previsionList: [WeatherDetailModel]) {
        self.previsionList = previsionList.reversed()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func filtredprevisionList() -> [String: [WeatherDetailModel]] {
        var newList = [String: [WeatherDetailModel]]()
        
        for prevision in previsionList {
            if newList.count > 0 {
                if newList.keys.contains(dateFormatter(date: prevision.getDate())) {
                    var weatherList = newList[dateFormatter(date: prevision.getDate())]!
                    weatherList.append(prevision)
                    newList[dateFormatter(date: prevision.getDate())] = weatherList
                } else {
                    newList[dateFormatter(date: prevision.getDate())] = [prevision]
                }
            } else {
                newList[dateFormatter(date: prevision.getDate())] = [prevision]
            }
        }
        return newList
    }
    
    func dateFormatter(date: String) -> String {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        return dateformatter.string(from: formatter.date(from: date)!)
    }
    
    func timeFormatter(date: String) -> String {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH"
        
        return dateformatter.string(from: formatter.date(from: date)!)
    }
    
    func getWeatherBy(date: String) -> [String: WeatherDetailModel] {
        
        var previsionByDate = [String: WeatherDetailModel]()
        
        for prevision in previsionList {
            print("----- \(prevision.getTemperature())")
            if date == dateFormatter(date: prevision.getDate()) {
                previsionByDate[timeFormatter(date: prevision.getDate())] = prevision
            }
        }
        return previsionByDate
    }
    
}
