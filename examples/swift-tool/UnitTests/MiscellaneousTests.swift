// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Cocoa
import XCTest

// returns a value of type String
func temperature(degrees: Double, scale: String) -> String
{
    return "The temperature is \(degrees)° \(scale)"
}

let s = temperature(degrees: 71.5, scale: "Fahrenheit")


class MiscellaneousTests: XCTestCase
{
    var foo: String = "Foo"
    
    func doSomething(closure: (() -> Void))
    {
        closure()
    }
    
    func testDoSomething()
    {
        doSomething(closure: {
            () -> Void in
            print("Doing something")
        })
        
        doSomething {
            () in
            print("Doing something else")
        }
        
        doSomething {
            _ in
            print("Doing something else again")
        }
        
        doSomething { print("Doing something else yet again") }
    }
    
    func modifyParamValueAsSideEffect( _ text: inout String)
    {
        print(text)
        text = "Bar"
    }
    
    func testModifyParamValueAsSideEffect()
    {
        var s = foo
        modifyParamValueAsSideEffect(&s)
        print(s)
    }
    
    func testDidSet()
    {
        var text: String = "Hello" {
            didSet {
                print("Set text to \(text), old value was \(oldValue)")
            }
        }
        text = "Bye"
        
        var number: Int = Int(123) {
            willSet {
                print("About to set number to new value \(newValue)")
            }
            didSet {
                print("Number is now \(number); old value was \(oldValue)")
            }
        }
        
        print(number)
        
        number = 5
    }
}
