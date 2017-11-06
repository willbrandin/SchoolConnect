//
//  ContactTeacherVC.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 11/5/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class ContactTeacherVC: UIViewController {
    
    //MARK: Properties
    
    //MARK: VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setupView()
    }
    
    //MARK: Methods
    func setupView() {
        self.title = "Reach your Teacher"
    }
    

}
