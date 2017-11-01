//
//  CalendarTableViewCell.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ event: CalendarEvent) {
        self.title.text = event.title
        self.date.text = Date.string(fromDate: event.startDate)
    }
    

}
