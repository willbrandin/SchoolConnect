//
//  NewsCollectionViewCell.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var newsArticlePhoto: UIImageView!
    
    //MARK: Methods
    func configureCell(news: NewsArticle) {
        titleLabel.text = news.title
        subtitleLabel.text = news.subtitle
        pubDateLabel.text = Date.string(fromDate: news.pubDate)
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 15.0
    }
    
    //MARK: Life Cycle
    override func layoutSubviews() {
        makeShadow()
    }
}
