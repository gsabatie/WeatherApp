//
//  searchrResultTableViewCell.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 21/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell, UITableViewCellRegistrable {

    static var nibName: String = "SearchResultTableViewCell"
    static var identifier: String = "SearchResultTableViewCell"
    
    // MARK: IBOutlet
    @IBOutlet weak private var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(mainLabelText: String, range:  [NSValue]) {
        
        let attributedText = NSMutableAttributedString(string: mainLabelText)
        attributedText.highlightTarget(range: range, color: UIColor.white)
        self.mainLabel.attributedText = attributedText
    }
}


private extension NSMutableAttributedString {
    func highlightTarget(range:  [NSValue], color: UIColor){

        if !range.isEmpty {
        self.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: color,
            range: range[0].rangeValue)
        }
            
    }
}
