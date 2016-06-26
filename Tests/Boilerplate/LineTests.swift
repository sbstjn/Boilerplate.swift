//
//  LineTests.swift
//  Boilerplate
//
//  Created by Sebastian Müller on 26/06/2016.
//  Copyright © 2016 Boilerplate Labs, LTD. All rights reserved.
//

import XCTest

class LineTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testDescription() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 4, y: 4)
        
        let l = Line(a: a, b: b)
        
        XCTAssertEqual(l.description, "Line (a:Point (x:1.0, y:2.0), b:Point (x:4.0, y:4.0))")
    }

}


#if os(Linux)
    extension LineTests {
        static var allTests : [(String, LineTests -> () throws -> Void)] {
            return [
                ("testDescription", testDescription),
            ]
        }
    }
#endif
