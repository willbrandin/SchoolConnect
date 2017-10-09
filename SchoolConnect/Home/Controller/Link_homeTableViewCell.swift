//
//  Link_homeTableViewCell.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/9/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class LinkHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var linkTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(link: HomeLink) {
        linkTitle.text = link.title
    }

}
