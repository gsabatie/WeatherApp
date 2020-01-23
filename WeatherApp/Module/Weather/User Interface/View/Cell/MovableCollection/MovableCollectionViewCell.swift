//
//  MovableCollectionViewCell.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 17/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit

final class MovableCollectionViewCell: UICollectionViewCell {

    static var identifier: String = "MovableCollectionViewCell"
    static var nibName: String = "MovableCollectionViewCell"
    
   // @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var subLabel: UILabel!
    
    @IBOutlet private weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        // Initialization code
    }
    
    func set(iconImage: UIImage) {
        self.iconImageView.image = iconImage.withRenderingMode(.alwaysTemplate)
    }
    
    func set(subLabelText: String) {
        self.subLabel.text = subLabelText
    }
    
    func set(valueLabelText: String) {
        self.valueLabel.text = valueLabelText
       }

}
