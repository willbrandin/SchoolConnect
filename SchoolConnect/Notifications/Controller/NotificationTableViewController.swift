//
//  NotificationTableViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/25/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "NotificationCell"

class NotificationTableViewController: UITableViewController {

    //MARK: Properties
    var notificationArray = [PushNotif]()
    
    //MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotificationData()
    }
    
    //MARK: Methods
    func fetchNotificationData(){
        PushNotif.downloadPushNotificationData { (notification) in
            self.notificationArray = notification
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
        return notificationArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NotificationTableViewCell {
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
    
    //MARK: Segue
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

