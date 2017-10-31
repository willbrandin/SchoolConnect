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
    
    //MARK: Properties
    var newsArray = [NewsArticle]()
    
    //MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewsData()
    }

    //MARK: Methods
    func fetchNewsData() {
        
        NewsArticle.downloadNewsData(completion: ({ (stories) in
            self.newsArray = stories
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }))
    }

    //MARK: Delegates
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedArticle: NewsArticle!
        selectedArticle = newsArray[indexPath.row]
        performSegue(withIdentifier: "NewsArticleSegue", sender: selectedArticle)
    }
    
    //MARK: Segue
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
