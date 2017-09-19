//
//  CalendarTableViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class CalendarTableViewController: UITableViewController {

    var eventsArray = [CalendarEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadEventData()
    }
    

    func downloadEventData() {
        //Get DATA
        //Must convert DATE STRING to a DATE OBJECT
        
        let date = Date()
        let newEvent = CalendarEvent(title: "Hello people!", date: date)
        eventsArray.append(newEvent)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
