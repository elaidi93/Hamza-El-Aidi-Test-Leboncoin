//
//  WeatherDetailViewController.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationGesture()
    }
    
    func setUpNavigationGesture() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

