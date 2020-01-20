//
//  BigWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 17/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit

class BigWeatherTableViewCell: UITableViewCell, UITableViewCellRegistrable {
    
    static var nibName: String = "BigWeatherTableViewCell"
    static var identifier: String = "BigWeatherTableViewCell"
    
    @IBOutlet private weak var mainLabel: UILabel!
    
    @IBOutlet private weak var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func set(mainLabelText: String) {
        self.mainLabel.text = mainLabelText
    }
    
    func set(subLabelText: String) {
        self.subLabel.text = subLabelText
    }
}


