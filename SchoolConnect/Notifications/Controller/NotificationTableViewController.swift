//
//  NotificationTableViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/25/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {

    var notificationArray = [PushNotif]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadPushNotificationData()
    }

    func downloadPushNotificationData() {
        let newNotif = PushNotif(title: "New Event Here!", message: "There is a new event going on that will be sooo cool!")
        let otherNotif = PushNotif(title: "Some other Title!", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat")
        notificationArray.append(newNotif)
        notificationArray.append(otherNotif)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as? NotificationTableViewCell {
            cell.configureCell(notificationArray[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedNotification: PushNotif!
        selectedNotification = notificationArray[indexPath.row]
        performSegue(withIdentifier: "didClickNotification", sender: selectedNotification)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "didClickNotification" {
            if let notifDetailVC = segue.destination as? NotificationViewController {
                if let notificationSelected = sender as? PushNotif {
                    notifDetailVC.notification = notificationSelected
                }
            }
        }
    }
}
