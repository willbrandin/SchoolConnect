//
//  NewsCollectionViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NewsArticleCell"

class NewsCollectionViewController: UICollectionViewController {
    
    var newsArray = [NewsArticle]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadNewsData()
    }
    
    func downloadNewsData() {
        //GET DATA?
        let story1 = NewsArticle(title: "Life School wins", subtitle: "Life school is a great school in Dallas", pubDate: "12/15/1993")
        let story2 = NewsArticle(title: "Oak Cliff wins award", subtitle: "Life school is a great school in Dallas", pubDate: "12/15/1993")
        let story3 = NewsArticle(title: "New High School", subtitle: "Life school is a great school in Dallas", pubDate: "12/15/1993")
        newsArray.append(story1)
        newsArray.append(story2)
        newsArray.append(story3)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? NewsCollectionViewCell {
            cell.configureCell(news: newsArray[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

   

}
