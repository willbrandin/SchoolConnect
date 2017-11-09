//
//  ContactTeacherVC.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 11/5/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

private let contactFormIdentifier = "TeacherContact"

class ContactTeacherVC: UITableViewController { 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: contactFormIdentifier) as? TeacherContactCell {
            return cell
        }
        return UITableViewCell()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
