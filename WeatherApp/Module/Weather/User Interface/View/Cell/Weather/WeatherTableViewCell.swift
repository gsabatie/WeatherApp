//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 17/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit


class WeatherTableViewCell: UITableViewCell, UITableViewCellRegistrable {
    
    static var nibName: String = "WeatherTableViewCell"
    static var identifier: String = "WeatherTableViewCell"
    
    // MARK: IBOutlet
    @IBOutlet weak private var statusLabel: UILabel!
    @IBOutlet weak private var leftValueLabel: UILabel!
    @IBOutlet weak private var rightValueLabel: UILabel!
    
    @IBOutlet weak private var iconImageView: UIImageView!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.iconImageView.tintColor = UIColor.white
    }
    
    func set(statusText: String) {
        self.statusLabel.text = statusText        
    }
    
    func set(leftValueText: String) {
        self.leftValueLabel.text = leftValueText
    }
    
    func set(rightValueText: String) {
        self.rightValueLabel.text = rightValueText
    }
    func set(iconImage: UIImage) {

        self.iconImageView.image = iconImage.withRenderingMode(.alwaysTemplate)
    }
}
