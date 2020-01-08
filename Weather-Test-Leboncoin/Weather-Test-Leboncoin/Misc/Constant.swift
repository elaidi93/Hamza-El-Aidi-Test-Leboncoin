//
//  Constant.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class Constant {
    
    private static let api_url = "https://www.infoclimat.fr/public-api/gfs/json?_ll="
    private static let auth = "ABpUQwJ8VHYHKlNkA3UGL1M7DjsPeQcgCnYGZQtuUC1TOFMyDm4GYFc5USwOIVVjWXQDYA02AzMHbFIqWCpePwBqVDgCaVQzB2hTNgMsBi1TZQ5qDzAHNgphBn4LeVAyUzlTMQ5zBmVXOlEtDjxVYllvA30NMQM%2FB3tSKlg0XjgAZFQ4AmJUNwdgUzYDMwYyU38OcQ81B2oKaAZiC2VQYVM2U2QOOQY2V2tROg46VWNZdANmDToDMwdgUjxYNl46AGBULwJ%2BVE8HG1MsA3MGcFM1DigPLQdqCjcGNQ%3D%3D&_c=f4b09ffa415e805974f87e03609a5078"
    
    static func api_url_with(latitude: String, longitude: String) -> String{
        return api_url + latitude + "," + longitude + "&_auth=" + auth
    }
}
