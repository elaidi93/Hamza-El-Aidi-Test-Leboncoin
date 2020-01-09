//
//  WeatherDetailViewController.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var titleDate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var previsionList: [String: WeatherDetailModel]!
    var date: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        titleDate.text = date
        
        implemetCellToTableView()
        tableViewDelegate()
        
    }
    
    func implemetCellToTableView() {
        let nib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "weather_cell")
    }
    
    func tableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WeatherDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previsionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weather_cell", for: indexPath) as! WeatherTableViewCell
        let prevision = previsionList[Array(previsionList.keys)[indexPath.row]]
        cell.previsionDescrition.text = Array(previsionList.keys)[indexPath.row] + "H"
        cell.temperature.text = "\(prevision!.getTemperature())°C"
        return cell
    }
}

extension WeatherDetailViewController: UITableViewDelegate {}


