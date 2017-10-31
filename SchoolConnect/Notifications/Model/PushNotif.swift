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
    
    //MARK: Methods
    static func downloadPushNotificationData(completion: @escaping ([PushNotif]) -> Void) {
        
        var notificationArray = [PushNotif]()
        
        let ref = Database.database().reference()
        let notificationRef = ref.child(SCHOOL_NAME).child(NOTIFICATIONS)
        notificationRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let message = dictionary["message"] as? String else { return }
                let newNotification = PushNotif(title: title, message: message)
                notificationArray.append(newNotification)
                completion(notificationArray)
            }
        }
    }
    
    //MARK: Inits
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}


