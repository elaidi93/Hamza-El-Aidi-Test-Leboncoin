//
//  PrevisionService.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/8/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Alamofire

class PrevisionService {
    
    static let shared = PrevisionService()
    
    func request(latitude: String, longitude: String, callback: @escaping (Any)->()) {
        let url = Constant.api_url_with(latitude: latitude, longitude: longitude)
        AF.request(url).responseJSON { response in
            if response.response?.statusCode == 200 {
                if let json = response.value as? NSDictionary {
                    PrevisionJsonParse.shared.parse(prevesion: json)
                }
            }
        }
    }
    
}
