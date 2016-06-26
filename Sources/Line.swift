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
    
}
