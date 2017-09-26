//
//  NewsCollectionViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

private let reuseIdentifier = "NewsArticleCell"

class NewsCollectionViewController: UICollectionViewController {
    
    var newsArray = [NewsArticle]()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadNewsData()
    }
    
    func downloadNewsData() {
        
        let ref = Database.database().reference()
        
        let newsRef = ref.child(SCHOOL_NAME).child("News")
        newsRef.observe(.childAdded) { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject] {
                print(snapshot)
                guard let title = dictionary["title"] as? String else {
                    return
                }
                guard let subtitle = dictionary["subtitle"] as? String else {
                    return
                }
                guard let date = dictionary["pubDate"] as? String else {
                    return
                }
                let newArticle = NewsArticle(title: title, subtitle: subtitle, pubDate: date)
                self.newsArray.append(newArticle)
                self.collectionView?.reloadData()
            }
        }
        
        
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
    
    //Sends Cell information to be accessed in the View Controller
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedArticle: NewsArticle!
        selectedArticle = newsArray[indexPath.row]
        performSegue(withIdentifier: "NewsArticleSegue", sender: selectedArticle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsArticleSegue" {
            if let newsArticleDetailVC = segue.destination as? NewsArticleViewController {
                if let articleSelected = sender as? NewsArticle {
                    newsArticleDetailVC.article = articleSelected
                }
            }
        }
    }
    

}
