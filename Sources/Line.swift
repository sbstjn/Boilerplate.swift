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
    
    public var slope: Double {
        return (a.y - b.y) / (a.x - b.x)
    }
    
    public func contains(p: Point) -> Bool {
        return p.y == self.slope * (p.x - a.x) + a.y
    }
        
    public var description: String {
        return "Line (a:\(self.a), b:\(self.b))"
    }
    
}
