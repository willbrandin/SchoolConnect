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
        
        featureDescription.text = feature.description.uppercased()
        switch feature.featureType {
        case .bullyReporting: featureTitle.text = "Bully Reporting"
            featureIcon.image = UIImage(named: "ls-default news")
        case .teacherContact: featureTitle.text = "Teacher Contact"
            featureIcon.image = UIImage(named: "ls-default news")
        }
    }
   
    func updateCorner(){
        featureIcon.layer.cornerRadius = 8.0
        featureIcon.layer.masksToBounds = true
    }
   
}
