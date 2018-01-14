//
//  HomeLink.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 10/9/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct HomeLink {
    
    //MARK: Properties
    var title: String!
    var linkURL: String!
    
    //MARK: Methods
    static func downloadLinksData(completion: @escaping ([HomeLink]) -> Void) {
        var links = [HomeLink]()
        let ref = Database.database().reference()
        let featureRef = ref.child(GlobalVariables.SCHOOL_NAME).child(GlobalVariables.LINKS)
        featureRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                guard let title = dictionary["title"] as? String else { return }
                guard let url = dictionary["url"] as? String else { return }
                let newLink = HomeLink(title: title, linkURL: url)
                links.append(newLink)
                completion(links)
            }
        }
    }
    
    
    //MARK: Inits
    init(title: String, linkURL: String) {
        self.title = title
        self.linkURL = linkURL
    }
    
}
