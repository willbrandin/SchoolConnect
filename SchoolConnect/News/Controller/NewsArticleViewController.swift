//
//  NewsArticleViewController.swift
//  SchoolConnect
//
//  Created by William S. Brandin on 9/18/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import UIKit

class NewsArticleViewController: UIViewController {

    //MARK: Properties
    var article: NewsArticle!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Method
    func setupView() {
        guard let title = article.title else {
            return
        }
        self.title = title
    }

}
