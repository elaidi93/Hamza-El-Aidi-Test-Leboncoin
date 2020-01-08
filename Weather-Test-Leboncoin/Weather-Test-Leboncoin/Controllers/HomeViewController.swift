//
//  ViewController.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/3/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    let list = [WeatherDetail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        instanciateLocationManager()
    }

    func instanciateLocationManager() {
        LocationManager.shared.requestAuthorization()
        LocationManager.shared.startTracking()
        LocationManager.shared.delegate = self
    }
    
    func updateTable() {
        
    }

}

extension HomeViewController: LocationManagerDelegate {
    func locationManager(didUpdate locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        PrevisionService.shared.request(latitude: "\(latitude)", longitude: "\(longitude)") { (list) in
            self.updateTable()
        }
        
    }
}
