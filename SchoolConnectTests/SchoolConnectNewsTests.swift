//
//  SchoolConnectNewsTests.swift
//  SchoolConnectTests
//
//  Created by William S. Brandin on 10/29/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import XCTest
@testable import SchoolConnect
import FirebaseDatabase

class SchoolConnectNewsTests: XCTestCase {
    
    func testCorrectHeadline() {

        let newsArticle = NewsArticle(title: "New Boys Event", subtitle: "Event", pubDate: "11/16/17")
        XCTAssertTrue(newsArticle.title == "New Boys Event")
    }
    
    func testCorrectFromDownload(){
       
    }
    
    
}
