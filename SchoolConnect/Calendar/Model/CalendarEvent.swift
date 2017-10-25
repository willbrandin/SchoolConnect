//
//  CalendarEvent.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation

struct CalendarEvent {
    
    var title: String
    var startDate: String
    var endDate: String
    var description: String
    var location: String
    
    init(title: String, startDate: String, endDate: String, description: String, location: String) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.description = description
        self.location = location
    }
}
