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
        let newsRef = ref.child(GlobalVariables.SCHOOL_NAME).child(GlobalVariables.NEWS_ARTICLE)
        newsRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let subtitle = dictionary["subtitle"] as? String else { return }
                guard let date = dictionary["pubDate"] as? String else { return }
                
                //Gets Date as a String
                //Sets as NSDate
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale.current
                dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
                let dateFromString = dateFormatter.date(from: date)
                
                print(dateFromString!)
                
                
                guard let pubDate = dateFromString else { return }
                
                guard let source = dictionary["source"] as? String else { return }
                guard let story = dictionary["story"] as? String else { return }
                if let imgUrl = dictionary["imgUrl"] as? String {
                    
                    let newArticle = NewsArticle(title: title, subtitle: subtitle, pubDate: pubDate, source: source, imgUrl: imgUrl, story: story)
                    newsItems.append(newArticle)
                    completion(newsItems)
                } else {
                    let newArticle = NewsArticle(title: title, subtitle: subtitle, pubDate: pubDate, source: source, imgUrl: GlobalVariables.DEFAULT_IMG_URL, story: story)
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

