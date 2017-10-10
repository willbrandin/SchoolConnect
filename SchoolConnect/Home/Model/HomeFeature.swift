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
    
    enum CustomFeature {
        case bullyReport
        case principalContact
        case newsSection
        case calendarSection
    }
    
    static func returnFeature(feature: CustomFeature) -> [HomeFeature] {
        var homeFeature = [HomeFeature]()
        switch feature {
        case .bullyReport: homeFeature.append(HomeFeature(title: "Bully Reporting", description: "Bullying is not tolerated here.", icon: #imageLiteral(resourceName: "ls-default news")))
        case .principalContact: homeFeature.append(HomeFeature(title: "Email the Principal", description: "You deserve direct communication", icon: #imageLiteral(resourceName: "ls-default news")))
        case .newsSection: homeFeature.append(HomeFeature(title: "News", description: "See the News Section", icon: #imageLiteral(resourceName: "ls-default news")))
        case .calendarSection: homeFeature.append(HomeFeature(title: "Calendar", description: "See the Event Calendar!", icon: #imageLiteral(resourceName: "ls-default news")))
        }
        return homeFeature
    }
    
}


