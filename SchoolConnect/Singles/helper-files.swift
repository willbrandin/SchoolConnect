//
//  constants.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/26/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import UIKit

//Global constants
let SCHOOL_NAME = "SchoolOfLife"
let CALENDAR_EVENT = "CalendarEvents"
let NEWS_ARTICLE = "News"
let NOTIFICATIONS = "Notifications"


//Extensions
class NotifRoundedImage: UIImageView {
    
    override func layoutSubviews() {
        updateCornerRadius()
    }
    func updateCornerRadius() {
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
    
}


