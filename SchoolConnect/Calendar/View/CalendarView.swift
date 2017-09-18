//
//  CalendarView.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class CalendarView: UIView {
    
    override func layoutSubviews() {
       updateCornerRadius()
        makeShadow()
    }

    func updateCornerRadius() {
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
    }
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 8.0
    }
}
