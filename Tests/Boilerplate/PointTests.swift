import XCTest

@testable import Boilerplate

class PointTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDescription() {
        let p = Point(x: 1, y: 5)

        XCTAssertEqual(p.description, "Point (x:1.0, y:5.0)")
    }

    func testBasicBooleanValues() {
        let a = Point(x: 4, y: 1)
        let b = Point(x: 8, y: 4)

        XCTAssertEqual(a.distance(point: b), b.distance(point: a))
        XCTAssertEqual(a.distance(point: b), 5)
    }

}

#if os(Linux)
    extension PointTests {
        static var allTests : [(String, PointTests -> () throws -> Void)] {
            return [
                ("testDescription", testDescription),
                ("testBasicBooleanValues", testBasicBooleanValues),
            ]
        }
    }
#endif
