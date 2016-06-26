import XCTest

@testable import Boilerplate

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
    
    func testContains() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 4, y: 4)
        let c = Point(x: 5, y: 5)
        
        let l = Line(a: a, b: b)
        
        XCTAssertTrue(l.contains(p: a))
        XCTAssertTrue(l.contains(p: b))
        
        XCTAssertFalse(l.contains(p: c))
    }

}


#if os(Linux)
    extension LineTests {
        static var allTests : [(String, LineTests -> () throws -> Void)] {
            return [
                ("testDescription", testDescription),
                ("testContains", testContains),
            ]
        }
    }
#endif
