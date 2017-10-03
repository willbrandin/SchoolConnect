//
//  CalendarEventViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit
import EventKit

class CalendarEventViewController: UIViewController {

    var calendarEvent: CalendarEvent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        self.title = calendarEvent.title
    }
    
    /// When User pushes Save to Calendar it calls the addEventtoCal Method
    /// Method takes in the title, start and end date, and location.
    @IBAction func didPressSaveToCalendar(_ sender: Any) {
        addEventToCalendar(title: calendarEvent.title, description: calendarEvent.description, startDate: dateChange(date: calendarEvent.startDate), endDate: dateChange(date: calendarEvent.endDate), location: calendarEvent.location)
    }
    ///Takes the CalendarEvent Date as a string and converts it to a Date object.
    func dateChange(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let date = dateFormatter.date(from: date)
        return date!
    }
    
    ///Adds the ability to add event to the user calendar as an event.
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, location: String, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                event.notes = description
                event.location = location
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
    
    ///Will open the sharing window to offer sharing settings for FB, Twitter, etc.
    @IBAction func didPressShare(_ sender: Any) {
    }
    
    
}
