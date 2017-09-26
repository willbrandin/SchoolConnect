//
//  NotificationViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/25/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    var notification: PushNotif!
    @IBOutlet weak var message: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        guard let title = notification.title else {
            return
        }
        guard let message = notification.message else {
            return
        }
        self.title = title
        self.message.text = message
    }


}
