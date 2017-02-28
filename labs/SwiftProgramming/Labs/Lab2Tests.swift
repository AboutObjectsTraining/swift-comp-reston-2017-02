import XCTest

@testable import SwiftProgramming

private let myRect = Rectangle(
    origin: Point(x: 5.0, y: 5.0),
    size: Size(width: 40.0, height: 20.0))

class Lab2Tests: XCTestCase
{
    override func setUp()    { super.setUp(); print("") }
    override func tearDown() { print(""); super.tearDown() }
    
    func testMe()
    {
        let rect1 = Rectangle(origin: myRect.origin, size: myRect.size)
        
        let center = rect1.center
        let area = rect1.area
        
        print("center is \(center), area is \(area)")
    }

    func testArea()
    {
        print(myRect)
        let expectedValue = myRect.width * myRect.height
        XCTAssertEqual(expectedValue, myRect.area, "Area should equal width times height.")
    }
    
    func testCenterProperty()
    {
        let expectedValue = Point(x: (myRect.x + myRect.width) / 2.0,
                                  y: (myRect.y + myRect.height) / 2.0)
        XCTAssert(myRect.center.x == expectedValue.x && myRect.center.y == expectedValue.y)
        print("myRect  = \(myRect)" + "\nnewRect = \(expectedValue)")
    }
    
    func testOffset()
    {
        let newRect = myRect.offsetBy(dx: 7.5, dy: 12.5)
        let expectedValue = Point(x: myRect.x + 7.5, y: myRect.y + 12.5)
        XCTAssert(expectedValue.x == myRect.x + 7.5 && expectedValue.y == myRect.y + 12.5)
        print("myRect  = \(myRect)" + "\nnewRect = \(newRect)")
    }
}
