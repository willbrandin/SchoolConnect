//
//  SchoolConnectNewsTests.swift
//  SchoolConnectTests
//
//  Created by William S. Brandin on 10/31/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import XCTest
@testable import SchoolConnect
import FirebaseDatabase
import Firebase

class SchoolConnectNewsTests: XCTestCase {
    
    var newsArray: [NewsArticle]?
    var done = false
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        NewsArticle.downloadNewsData { (stories) in
            self.newsArray = stories
            self.done = true
        }
        waitUntil(timeout: 5) { done }
    }
    
    override func tearDown() {
        newsArray = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testCorrectTitleDownloaded(){
        XCTAssertEqual(self.newsArray![0].title, "Soccer Team Wins!")
    }
    
    func testDowloadedNewsNotNil() {
        XCTAssertNotNil(self.newsArray)
    }
    func testCorrectNumberDownloaded() {
        let number = 3
        XCTAssertEqual(self.newsArray?.count, number)
    }
    
    func testDefaultImgURL() {
        let testArticleUrl = self.newsArray![2].imgUrl
        let testURL = GlobalVariables.DEFAULT_IMG_URL
        
        XCTAssertEqual(testURL, testArticleUrl)
    }
    
    
    
    func waitUntil(timeout: TimeInterval, predicate:(() -> Bool)) {
        let timeoutTime = NSDate(timeIntervalSinceNow: timeout).timeIntervalSinceReferenceDate
        
        while (!predicate() && NSDate.timeIntervalSinceReferenceDate < timeoutTime) {
            RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.25) as Date)
        }
    }
    
}
