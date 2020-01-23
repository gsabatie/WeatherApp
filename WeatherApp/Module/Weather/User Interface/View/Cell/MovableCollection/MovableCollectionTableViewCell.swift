//
//  MovableCollectionTableViewCell.swift
//  WeatherApp
//
//  Created by guillaume sabatié on 17/01/2020.
//  Copyright © 2020 Guillaume Sabatie. All rights reserved.
//

import UIKit


final class MovableCollectionTableViewCell: UITableViewCell, UITableViewCellRegistrable {
    
    static var identifier: String = "MovableCollectionTableViewCell"
    static var nibName: String = "MovableCollectionTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var forecastInfos: [ForecastInfo] = [ForecastInfo]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var collectionViewLatout: UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in
            let item: NSCollectionLayoutItem =
                NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.25),
                        heightDimension: .fractionalHeight(1.0)))
                 item.contentInsets =
                    NSDirectionalEdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0)
                 
            let group: NSCollectionLayoutGroup =
                NSCollectionLayoutGroup
                    .horizontal(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(0.95),
                            heightDimension: .absolute(90)),
                        subitems: [item])
                 
            let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                 section.contentInsets =
                    NSDirectionalEdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0)
                 section.orthogonalScrollingBehavior = .groupPaging
                 return section
             }

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        
        let nib = UINib(nibName: MovableCollectionViewCell.nibName, bundle: nil)
        self.collectionView
            .register(
                nib,
                forCellWithReuseIdentifier: MovableCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = self.collectionViewLatout
    }
}

// MARK: - Extension UICollectionViewDataSource
extension MovableCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastInfos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell: MovableCollectionViewCell =
            collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: MovableCollectionViewCell.identifier,
                    for: indexPath as IndexPath)
                as! MovableCollectionViewCell
        
        let forecastInfo: ForecastInfo = self.forecastInfos[indexPath.row]
        
        if let image: UIImage = UIImage(named: forecastInfo.iconName) {
            cell.set(iconImage: image)
        }
        cell.set(subLabelText: forecastInfo.title)
        cell.set(valueLabelText: forecastInfo.value)
        return cell
    }
}

