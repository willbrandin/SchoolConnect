//
//  PushNotif.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/25/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
class PushNotif {
    let title: String
    let message: String
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}

let newNotif = PushNotif(title: "Dog", message: "Dogs are cool")
