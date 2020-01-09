//
//  DataManager.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/8/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    func insertPrevisonLIst(weatherList: [WeatherDetailModel]) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        deletePrevisonLIst()
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "WeatherDetail", in: managedContext)!
        
        for weatherDetail in weatherList {
            let weatherDetailEntity = NSManagedObject(entity: userEntity, insertInto: managedContext)
            weatherDetailEntity.setValue(weatherDetail.getDate(), forKey: "date")
            weatherDetailEntity.setValue(weatherDetail.getTemperature(), forKey: "temperature")
            weatherDetailEntity.setValue(weatherDetail.getVent(), forKey: "vent")
            weatherDetailEntity.setValue(weatherDetail.getNeige(), forKey: "neige")
            weatherDetailEntity.setValue(weatherDetail.getPression(), forKey: "pression")
            weatherDetailEntity.setValue(weatherDetail.getPluie(), forKey: "pluie")
            weatherDetailEntity.setValue(weatherDetail.getHumidite(), forKey: "humidite")
        }
        
        do {
            try managedContext.save()
        } catch {
            print("save data error: \(error.localizedDescription)")
        }
        
    }
    
    func selectPrevisonLIst() -> [WeatherDetailModel] {
        
        var previsionList = [WeatherDetailModel]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return [WeatherDetailModel]()}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherDetail")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                let weatherDetail = WeatherDetailModel(date: data.value(forKey: "date") as! String, temperature: data.value(forKey: "temperature") as! Double, pluie: data.value(forKey: "pluie") as! Double, humidite: data.value(forKey: "humidite") as! Double, pression: data.value(forKey: "pression") as! Double, vent: data.value(forKey: "vent") as! Double, neige: data.value(forKey: "neige") as! String)
                previsionList.append(weatherDetail)
            }
        } catch {
            print("select Data error: \(error.localizedDescription)")
            return previsionList
        }
        
        return previsionList
    }
    
    func deletePrevisonLIst() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherDetail")
        do {
            let items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for item in items {
                managedContext.delete(item)
            }
            
            do {
                try managedContext.save()
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
