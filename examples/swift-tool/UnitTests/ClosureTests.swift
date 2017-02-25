import Cocoa
import XCTest

// Composed character sequence.
//
//let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let mac = "\u{1f4bb}"
let wavyDash = UnicodeScalar(0x03030)
let construction: UnicodeScalar = "\u{1f6a7}"

class ClosureTests: XCTestCase
{
    override func setUp() {
        super.setUp(); print("")
    }
    override func tearDown() {
        print(""); super.tearDown()
    }
    
    func testClosure()
    {
        let wavyLine = String(repeating: String(describing: WavyDash), count: 7)
        let barriers = String(repeating: String(Construction), count: 11)
        
        showDate {
            print("\(wavyLine)" + " MESSAGE " + "\(wavyLine)" + Mac + barriers + Mac)
        }
    }
}


extension ClosureTests
{
    func showDate(_ completion: () -> Void)
    {
        print("The current date and time is now \(Date())")
        completion()
    }
}

// Tail Recursion
extension ClosureTests
{
    func factorial(_ x: Int, total: Int = 1) -> Int
    {
        // if x == 1 { return total }
        // 
        // return factorial(x - 1, total: x * total)
        
        return x == 1 ? total : factorial(x - 1, total: x * total)
    }
    
    func testFactorial()
    {
        print(factorial(6))
    }
}

//extension String
//{
//    func substringToIndex(index: Int) -> String
//    {
//        
//    }
//}
