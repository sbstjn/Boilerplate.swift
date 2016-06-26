import Foundation

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

public class Point: CustomStringConvertible {

    var x: Double
    var y: Double

    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    public func distance(point: Point) -> Double {
        return sqrt((self.x - point.x)*(self.x - point.x) + (self.y - point.y)*(self.y - point.y))
    }

    public var description: String {
        return "Point (x:\(self.x), y:\(self.y))"
    }

}
