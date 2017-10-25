//
//  HomeLink.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/9/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation

struct HomeLink {
    var title: String
    var linkURL: String
    
    init(title: String, linkURL: String) {
        self.title = title
        self.linkURL = linkURL
    }
    
    
    static func downloadLinksData() -> [HomeLink] {
        var links = [HomeLink]()
        
        let link1 = HomeLink(title: "Link1", linkURL: "Link")
        let link2 = HomeLink(title: "Link2", linkURL: "Link")
        let link3 = HomeLink(title: "Link3", linkURL: "Link")
        
        links = [link1, link2, link3]
        return links
    }
    
}
