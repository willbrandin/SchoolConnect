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


class NotificationTableViewController: UITableViewController {

    
    var notificationArray = [PushNotif]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadPushNotificationData()
    }

    func downloadPushNotificationData() {
        
        let ref = Database.database().reference()
        let notificationRef = ref.child(SCHOOL_NAME).child("Notifications")
        notificationRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let message = dictionary["message"] as? String else { return }
                let newNotification = PushNotif(title: title, message: message)
                self.notificationArray.append(newNotification)
                self.tableView.reloadData()
            }
        }
    }
    
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
