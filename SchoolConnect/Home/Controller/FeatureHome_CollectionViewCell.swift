//
//  FeatureHome_CollectionViewCell.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/9/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class FeatureHomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featureIcon: UIImageView!
    @IBOutlet weak var featureTitle: UILabel!
    @IBOutlet weak var featureDescription: UILabel!
    
    override func layoutSubviews() {
        updateCorner()
    }
    
    func configureCell(feature: HomeFeature) {
        featureIcon.image = feature.icon
        featureTitle.text = feature.title
        featureDescription.text = feature.description
    }
    func updateCorner(){
        featureIcon.layer.cornerRadius = 8.0
        featureIcon.layer.masksToBounds = true
    }
   
}
