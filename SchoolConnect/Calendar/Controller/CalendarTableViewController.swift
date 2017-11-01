//
//  CalendarTableViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit


private let reuseIdentifier = "CalendarCell"

class CalendarTableViewController: UITableViewController {
 
    //MARK: Properties
    var eventsArray = [CalendarEvent]()
    
    //MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEventData()
    }
    
    //MARK: Methods
    func fetchEventData() {
        CalendarEvent.downloadEventData { (event) in
            self.eventsArray = event
            self.eventsArray.sort(by: { $0.startDate.timeIntervalSinceNow < $1.startDate.timeIntervalSinceNow })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    //MARK: Delegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CalendarTableViewCell {
            cell.configureCell(eventsArray[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedEvent: CalendarEvent!
        selectedEvent = eventsArray[indexPath.row]
        self.performSegue(withIdentifier: "CalendarEventSegue", sender: selectedEvent)
    }
    
    //MARK: Segue
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
