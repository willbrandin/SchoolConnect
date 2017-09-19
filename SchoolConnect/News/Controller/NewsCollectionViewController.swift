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

   

}
