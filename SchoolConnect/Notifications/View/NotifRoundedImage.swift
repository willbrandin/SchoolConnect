//
//  NotifRoundedImage.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/25/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class NotifRoundedImage: UIImageView {

    override func layoutSubviews() {
        updateCornerRadius()
    }
    func updateCornerRadius() {
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }

}
