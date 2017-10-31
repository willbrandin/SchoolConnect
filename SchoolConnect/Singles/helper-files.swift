//
//  constants.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/26/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import UIKit



//Global Constants
///Used for Database Reference's/Child Names for Firebase
//
struct GlobalVariables {
    static let SCHOOL_NAME = "SchoolOfLife"
    static let CALENDAR_EVENT = "CalendarEvents"
    static let NEWS_ARTICLE = "News"
    static let NOTIFICATIONS = "Notifications"
}

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

extension UIColor{
    class func rbg(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        let color = UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        return color
    }
}


