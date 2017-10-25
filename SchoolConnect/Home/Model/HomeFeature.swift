//
//  HomeFeature.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/9/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import UIKit

struct HomeFeature {
    var title: String
    var description: String
    var icon: UIImage
    
    init(title: String, description: String, icon: UIImage) {
        self.title = title
        self.description = description
        self.icon = icon
    }
    
    
    
    static func downloadFeaturesData() -> [HomeFeature] {
        var features: [HomeFeature]
    
        let feature1 = HomeFeature(title: "Bully Reporting", description: "Bullying is not tolerated here.", icon: #imageLiteral(resourceName: "ls-default news"))
        let feature2 = HomeFeature(title: "Email the Principal", description: "You deserve direct communication", icon: #imageLiteral(resourceName: "ls-default news"))
        let feature3 = HomeFeature(title: "News", description: "See the News Section", icon: #imageLiteral(resourceName: "ls-default news"))
        let feature4 = HomeFeature(title: "Calendar", description: "See the Event Calendar!", icon: #imageLiteral(resourceName: "ls-default news"))

        features = [feature1, feature2, feature3, feature4]    
        return features
    }
    
}


