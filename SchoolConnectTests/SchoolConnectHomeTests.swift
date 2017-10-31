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
    
    func testCorrectLinkOpensBasedOnCorrectInput(){
        let linkTitle = "Link3"
        HomeLink.downloadLinksData { (links) in
            let link3 = links[2]
            XCTAssertTrue(linkTitle == link3.title)
        }
    }
    
    func testHomeLinksAreNotNil() {
        HomeLink.downloadLinksData { (links) in
            XCTAssertNotNil(links)
        }
    }
    
    
}
