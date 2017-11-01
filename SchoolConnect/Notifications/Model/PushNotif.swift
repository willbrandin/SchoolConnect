//
//  PushNotif.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/25/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct PushNotif {
    
    //MARK: Properties
    let title: String!
    let message: String!
    let timestamp: Date!
    
    //MARK: Methods
    static func downloadPushNotificationData(completion: @escaping ([PushNotif]) -> Void) {
        
        var notificationArray = [PushNotif]()
        
        let ref = Database.database().reference()
        let notificationRef = ref.child(GlobalVariables.SCHOOL_NAME).child(GlobalVariables.NOTIFICATIONS)
        notificationRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let message = dictionary["message"] as? String else { return }
                guard let downloadedTimestamp = dictionary["timestamp"] as? String else { return }
                guard let timestamp = Date.date(fromString: downloadedTimestamp) else { return }
                
                let newNotification = PushNotif(title: title, message: message, timestamp: timestamp)
                notificationArray.append(newNotification)
                completion(notificationArray)
            }
        }
    }
    
    //MARK: Inits
    init(title: String, message: String, timestamp: Date) {
        self.title = title
        self.message = message
        self.timestamp = timestamp
    }
}


