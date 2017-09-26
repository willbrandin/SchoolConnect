//
//  CalendarTableViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CalendarTableViewController: UITableViewController {
 
    var eventsArray = [CalendarEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadEventData()
    }
    
    ///Parses data for calendar event. 
    func downloadEventData() {
        //Firebase Reference
        let ref = Database.database().reference()
        let calendarEventRef = ref.child(SCHOOL_NAME).child("CalendarEvents")
        calendarEventRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let date = dictionary["date"] as? String else { return }
                let newEvent = CalendarEvent(title: title, date: date)
                self.eventsArray.append(newEvent)
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for: indexPath) as? CalendarTableViewCell {
            cell.configureCell(eventsArray[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    //Sends TblVw Cell Data and sends it to the ViewController
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedEvent: CalendarEvent!
        selectedEvent = eventsArray[indexPath.row]
        self.performSegue(withIdentifier: "CalendarEventSegue", sender: selectedEvent)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CalendarEventSegue" {
            if let eventDetailVC = segue.destination as? CalendarEventViewController {
                if let eventSelected = sender as? CalendarEvent {
                    eventDetailVC.calendarEvent = eventSelected
                }
            }
        }
    }
}
