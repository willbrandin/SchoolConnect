//
//  SchoolConnectTests.swift
//  SchoolConnectTests
//
//  Created by William S. Brandin on 10/28/17.
//  Copyright © 2017 William S. Brandin. All rights reserved.
//

import XCTest
@testable import SchoolConnect

class SchoolConnectHomeTests: XCTestCase {
    
    var homeLinks: [HomeLink]?
    var done = false
    
    override func setUp() {
        HomeLink.downloadLinksData { (links) in
            self.homeLinks = links
            self.done = true
        }
        waitUntil(timeout: 5) { done }
    }
    
    
    override func tearDown() {
        homeLinks = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCorrectLinkOpensBasedOnCorrectInput(){
        let linkTitle = "Link3"
        XCTAssertTrue(linkTitle == self.homeLinks![2].title, "The Title is not correct")
    }
    
    func testHomeLinksAreNotNil() {
        XCTAssertNotNil(self.homeLinks)
    }
    
    func waitUntil(timeout: TimeInterval, predicate:(() -> Bool)) {
        let timeoutTime = NSDate(timeIntervalSinceNow: timeout).timeIntervalSinceReferenceDate
        
        while (!predicate() && NSDate.timeIntervalSinceReferenceDate < timeoutTime) {
            RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: NSDate(timeIntervalSinceNow: 0.25) as Date)
        }
    }
    
}
