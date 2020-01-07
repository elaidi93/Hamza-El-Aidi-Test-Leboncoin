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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        instanciateLocationManager()
        
    }

    func instanciateLocationManager() {
        LocationManager.shared.requestAuthorization()
        LocationManager.shared.startTracking()
        LocationManager.shared.delegate = self
    }

}

extension HomeViewController: LocationManagerDelegate {
    func locationManager(didUpdate locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        print("\(userLocation.coordinate.latitude),\(userLocation.coordinate.longitude)")
    }
}
