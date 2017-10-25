//
//  News.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation

struct NewsArticle {
    
    var title: String!
    var subtitle: String!
    var source: String!
    var pubDate: String!
    var imgUrl: String!
    var fullStory: String!
    
    init(title: String, subtitle: String, pubDate: String) {
        self.title = title
        self.subtitle = subtitle
        self.pubDate = pubDate
    }
    ///Full Instance
    init(title: String, subtitle: String, pubDate: String, source: String, imgUrl: String, story: String) {
        self.title = title
        self.subtitle = subtitle
        self.pubDate = pubDate
        self.source = source
        self.imgUrl = imgUrl
        self.fullStory = story
    }
}
