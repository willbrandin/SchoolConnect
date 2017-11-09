//
//  ContactTeacherVC.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 11/5/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class ContactTeacherVC: UITableViewController {
    
    //MARK: Properties
    
    //MARK: VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
