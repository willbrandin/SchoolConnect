//
//  News.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct NewsArticle {
    
    //MARK: Properties
    var title: String!
    var subtitle: String!
    var source: String!
    var pubDate: Date!
    var imgUrl: String!
    var fullStory: String!
    
    
    //MARK: Methods
    static func downloadNewsData(completion: @escaping ([NewsArticle]) -> Void) {
        var newsItems = [NewsArticle]()
        let ref = Database.database().reference()
        let newsRef = ref.child(NetworkVariables.SCHOOL_NAME).child(NetworkVariables.NEWS_ARTICLE)
        newsRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let subtitle = dictionary["subtitle"] as? String else { return }
                
                guard let downloadDate = dictionary["pubDate"] as? String else { return }
                guard let pubDate = Date.date(fromString: downloadDate) else { return }
                
                guard let source = dictionary["source"] as? String else { return }
                guard let story = dictionary["story"] as? String else { return }
                if let imgUrl = dictionary["imgUrl"] as? String {
                    
                    let newArticle = NewsArticle(title: title, subtitle: subtitle, pubDate: pubDate, source: source, imgUrl: imgUrl, story: story)
                    newsItems.append(newArticle)
                    completion(newsItems)
                } else {
                    let newArticle = NewsArticle(title: title, subtitle: subtitle, pubDate: pubDate, source: source, imgUrl: NetworkVariables.DEFAULT_IMG_URL, story: story)
                    newsItems.append(newArticle)
                    completion(newsItems)
                }
            }
        }
    }
    
    
    //MARK: Inits
    init(title: String, subtitle: String, pubDate: Date, source: String, imgUrl: String, story: String) {
        self.title = title
        self.subtitle = subtitle
        self.pubDate = pubDate
        self.source = source
        self.imgUrl = imgUrl
        self.fullStory = story
    }
}

