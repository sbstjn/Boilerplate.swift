import Foundation

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

public class Line: CustomStringConvertible {

    var a: Point
    var b: Point

    public init(a: Point, b: Point) {
        self.a = a
        self.b = b
    }

    public var description: String {
        return "Line (a:\(self.a), b:\(self.b))"
    }

    public var slope: Double {
        return (a.y - b.y) / (a.x - b.x)
    }

    public func calculate(x: Double) -> Double {
        return slope * (x - a.x) + a.y;
    }

    public func contains(p: Point) -> Bool {
        return p.y == calculate(x: p.x)
    }

    public func isAbove(p: Point) -> Bool {
        return p.y > calculate(x: p.x)
    }

    public func isBelow(p: Point) -> Bool {
        return p.y < calculate(x: p.x)
    }

    public func isAbove(l: Line) -> Bool {
        return !crosses(l: l) && calculate(x: a.x) > l.calculate(x: a.x)
    }

    public func isBelow(l: Line) -> Bool {
        return !crosses(l: l) && calculate(x: a.x) < l.calculate(x: a.x)
    }

    public func isAbove(l: Line, x: Double) -> Bool {
        return calculate(x: x) > l.calculate(x: x)
    }

    public func isBelow(l: Line, x: Double) -> Bool {
        return calculate(x: x) < l.calculate(x: x)
    }

    public func isEqual(l: Line) -> Bool {
        return contains(p: l.a) && l.slope == slope
    }

    public func parallel(l: Line) -> Bool {
        return !crosses(l: l) && !isEqual(l: l)
    }

    public func crosses(l: Line) -> Bool {
        return slope != l.slope
    }

    public func crossesAt(l: Line) -> Point {
        let tmp1 = slope - l.slope
        let tmp2 = l.a.y + a.y

        let pos = tmp2 / tmp1

        return Point(x: pos, y: calculate(x: pos))
    }

}
