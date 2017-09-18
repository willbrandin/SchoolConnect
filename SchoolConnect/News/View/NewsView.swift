//
//  NewsView.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class NewsView: UIView {

    override func layoutSubviews() {
        updateCornerRadius()
    }
    func updateCornerRadius() {
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}
