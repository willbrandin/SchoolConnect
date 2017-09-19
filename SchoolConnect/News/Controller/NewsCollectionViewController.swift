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
        //GET pubDate as a string object and convert to DATE object. Will display class DATE.
        //Store as a string?
        let date = Date()
        let news = NewsArticle(title: "Life School News", subtitle: "Your news for the week", pubDate: date)
        newsArray.append(news)
        self.collectionView?.reloadData()
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
