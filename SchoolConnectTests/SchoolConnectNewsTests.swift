//
//  SchoolConnectNewsTests.swift
//  SchoolConnectTests
//
//  Created by William S. Brandin on 10/29/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import XCTest
@testable import SchoolConnect

class SchoolConnectNewsTests: XCTestCase {
    
    
    func testDownloadedDataNotNil() {
        
        NewsArticle.downloadNewsData { (articles) in
            
            XCTAssertNotNil(articles)
        }
    }
    
    func testArticlesNotNil() {
        NewsArticle.downloadNewsData { (articles) in
            XCTAssertNil(articles)
        }
    }
    
    func testCorrectFromDownload(){
        let newArticleTitle = "Life School announces new donor program"
        NewsArticle.downloadNewsData { (articles) in
            let article = articles[1]
            //This is where I use the data
            XCTAssertTrue(newArticleTitle == article.subtitle)
        }
    }
    
}
