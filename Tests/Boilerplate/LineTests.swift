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

    func testIsAbovePoint() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 4, y: 4)

        let l = Line(a: a, b: b)

        XCTAssertTrue(l.isAbove(p: Point(x: 1, y: 3)))
        XCTAssertFalse(l.isAbove(p: Point(x: 1, y: 1)))
        XCTAssertFalse(l.isAbove(p: Point(x: 1, y: 2)))
    }

    func testIsBelowPoint() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 4, y: 4)

        let l = Line(a: a, b: b)

        XCTAssertFalse(l.isBelow(p: Point(x: 1, y: 3)))
        XCTAssertFalse(l.isBelow(p: Point(x: 1, y: 2)))
        XCTAssertTrue(l.isBelow(p: Point(x: 1, y: 1)))
    }

    func testIsBelowLine() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 2, y: 2)

        let c = Point(x: 1, y: 4)
        let d = Point(x: 2, y: 4)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: c, b: d)

        XCTAssertTrue(l1.isBelow(l: l2))
        XCTAssertFalse(l2.isBelow(l: l1))
        XCTAssertFalse(l2.isBelow(l: l1))
    }

    func testIsAboveLine() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 2, y: 2)

        let c = Point(x: 1, y: 4)
        let d = Point(x: 2, y: 4)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: c, b: d)

        XCTAssertTrue(l2.isAbove(l: l1))
        XCTAssertFalse(l1.isAbove(l: l2))
        XCTAssertFalse(l1.isAbove(l: l2))
    }

    func testIsBelowLineAtPoint() {
        let a = Point(x: 0, y: 0)
        let b = Point(x: 1, y: 1)

        let c = Point(x: 0, y: 0)
        let d = Point(x: -1, y: 1)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: c, b: d)

        XCTAssertTrue(l1.isBelow(l: l2, x: -1))
        XCTAssertTrue(l2.isBelow(l: l1, x:  1))

        XCTAssertFalse(l2.isBelow(l: l1, x: 0))
        XCTAssertFalse(l1.isBelow(l: l2, x: 0))
        XCTAssertFalse(l1.isBelow(l: l1, x: 0))
    }

    func testIsAboveLineAtPoint() {
        let a = Point(x: 0, y: 0)
        let b = Point(x: 1, y: 1)

        let c = Point(x: 0, y: 0)
        let d = Point(x: -1, y: 1)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: c, b: d)

        XCTAssertTrue(l2.isAbove(l: l1, x: -1))
        XCTAssertTrue(l1.isAbove(l: l2, x:  1))

        XCTAssertFalse(l2.isAbove(l: l1, x: 0))
        XCTAssertFalse(l1.isAbove(l: l2, x: 0))
        XCTAssertFalse(l1.isAbove(l: l1, x: 0))
    }

    func testIsEqual() {
        let a = Point(x: 1, y: 2)
        let b = Point(x: 4, y: 4)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: b, b: a)

        let c = Point(x: 8, y: l1.calculate(x: 8))
        let d = Point(x: 9, y: 1)

        let l3 = Line(a: a, b: c)
        let l4 = Line(a: c, b: d)

        XCTAssertTrue(l1.isEqual(l: l2))
        XCTAssertTrue(l1.isEqual(l: l3))

        XCTAssertFalse(l1.isEqual(l: l4))
    }

    func testCrosses() {
        let a = Point(x: 0, y: 0)
        let b = Point(x: 1, y: 1)

        let c = Point(x: 0, y: 0)
        let d = Point(x: -1, y: 1)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: c, b: d)

        XCTAssertTrue(l1.crosses(l: l2))
    }

    func testCrossesAt() {
        let a = Point(x: 0, y: 0)
        let b = Point(x: 1, y: 1)

        let c = Point(x: 0, y: 0)
        let d = Point(x: -1, y: 1)

        let l1 = Line(a: a, b: b)
        let l2 = Line(a: c, b: d)

        XCTAssertTrue(l1.crosses(l: l2))

        let expected = Point(x: 0, y: 0)
        let crossing = l1.crossesAt(l: l2)

        XCTAssertEqual(crossing.x, expected.x)
        XCTAssertEqual(crossing.y, expected.y)
    }
}


#if os(Linux)
    extension LineTests {
        static var allTests : [(String, LineTests -> () throws -> Void)] {
            return [
                ("testDescription", testDescription),
                ("testContains", testContains),
                ("testIsAbovePoint", testIsAbovePoint),
                ("testIsAboveLine", testIsAboveLine),
                ("testIsAboveLineAtPoint", testIsAboveLineAtPoint),
                ("testIsBelowPoint", testIsBelowPoint),
                ("testIsBelowLine", testIsBelowLine),
                ("testIsBelowLineAtPoint", testIsBelowLineAtPoint),
                ("testIsEqual", testIsEqual),
                ("testCorsses", testCrosses),
                ("testCorssesAt", testCrossesAt),
            ]
        }
    }
#endif
