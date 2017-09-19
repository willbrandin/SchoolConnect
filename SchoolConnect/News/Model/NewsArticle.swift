//
//  News.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation

class NewsArticle {
    
    var title: String!
    var subtitle: String!
    var source: String!
    var pubDate: Date!
    var imgUrl: String!
    
    init(title: String, subtitle: String, pubDate: Date) {
        self.title = title
        self.subtitle = subtitle
        self.pubDate = pubDate
    }
}




