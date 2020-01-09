//
//  WeatherTableViewCell.swift
//  Weather-Test-Leboncoin
//
//  Created by hamza on 1/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var previsionDescrition: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var container: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        container.layer.cornerRadius = container.frame.height / 3
        container.layer.borderColor = UIColor.black.cgColor
        container.layer.borderWidth = 1
        
    }
    
    

}
