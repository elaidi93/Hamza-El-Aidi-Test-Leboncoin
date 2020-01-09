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
    
    @IBOutlet weak var tableView: UITableView!
    
    var list : [String: [WeatherDetailModel]]!
    var weatherDetailViewModel: WeatherDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        instanciateLocationManager()
        implemetCellToTableView()
        tableViewDelegate()
    }

    func instanciateLocationManager() {
        LocationManager.shared.requestAuthorization()
        LocationManager.shared.startTracking()
        LocationManager.shared.delegate = self
    }
    
    func tableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        updateTable()
    }
    
    func implemetCellToTableView() {
        let nib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "weather_cell")
    }
    
    func updateTable() {
        weatherDetailViewModel = WeatherDetailViewModel(previsionList: DataManager.shared.selectPrevisonLIst())
        list = weatherDetailViewModel.filtredprevisionList()
        tableView.reloadData()
    }

}

extension HomeViewController: LocationManagerDelegate {
    func locationManager(didUpdate locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        PrevisionService.shared.request(latitude: "\(latitude)", longitude: "\(longitude)") { (response) in
            self.updateTable()
        }
    }
    
    func locationManagerNotUpdate() {
        let latitude = "48.85341"
        let longitude = "2.3488"
        PrevisionService.shared.request(latitude: "\(latitude)", longitude: "\(longitude)") { (response) in
            self.updateTable()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail_segue" {
            let destination = segue.destination as! WeatherDetailViewController
            destination.previsionList = weatherDetailViewModel.getWeatherBy(date: Array(list.keys)[sender as! Int])
            destination.date = Array(list.keys)[sender as! Int]
        }
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "weather_cell", for: indexPath) as! WeatherTableViewCell
        let prevision = list[Array(list.keys)[indexPath.row]]
        cell.previsionDescrition.text = Array(list.keys)[indexPath.row]
        cell.temperature.text = "\(prevision!.first!.getTemperature())°C"
        return cell
    }

}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "detail_segue", sender: indexPath.row)
    }
    
}
