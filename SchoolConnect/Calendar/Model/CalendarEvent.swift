//
//  CalendarEvent.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct CalendarEvent {
    
    //MARK: Properties
    var title: String!
    var startDate: Date!
    var endDate: Date!
    var description: String!
    var location: String!
    
    
    //MARK: Methods
    static func downloadEventData(completion: @escaping ([CalendarEvent]) -> Void) {
        var eventsArray = [CalendarEvent]()
        //Firebase Reference
        let ref = Database.database().reference()
        let calendarEventRef = ref.child(NetworkVariables.SCHOOL_NAME).child(NetworkVariables.CALENDAR_EVENT)
        calendarEventRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let downloadedStartDate = dictionary["startDate"] as? String else { return }
                guard let startDate = Date.date(fromString: downloadedStartDate) else { return }
                
                guard let downloadedEndDate = dictionary["endDate"] as? String else { return }
                guard let endDate = Date.date(fromString: downloadedEndDate) else { return }
                
                guard let description = dictionary["description"] as? String else { return }
                guard let location = dictionary["location"] as? String else { return }
                let newEvent = CalendarEvent(title: title, startDate: startDate, endDate: endDate, description: description, location: location)
                eventsArray.append(newEvent)
                completion(eventsArray)
            }
        }
    }
    
    //MARK: Inits
    init(title: String, startDate: Date, endDate: Date, description: String, location: String) {
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.description = description
        self.location = location
    }
}
