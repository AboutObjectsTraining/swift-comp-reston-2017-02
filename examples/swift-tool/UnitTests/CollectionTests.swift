//
//  CollectionTests.swift
//  swift-tool
//
//  Created by Jonathan Lehr on 10/17/16.
//  Copyright © 2016 About Objects. All rights reserved.
//

import XCTest

class CollectionTests: XCTestCase
{
    func testArrayWithGenericType() {
        // declare an array with elements of type String
        var a: Array<String>
        // ... using shorthand syntax
        var b: [String]
        
        // instantiate an array with elements of type String
        a = Array<String>()
        // ... using shorthand syntax
        a = [String]()
        // ... or just
        a = []
        
        b = []
        
        
        // appending elements
        a.append("Fred")
        a.append("Jill")
        
        // using subscript notation to access array elements
        let name1 = a[0]
        print(name1)
        
        print(a[0])
        print(a)
        print(b)
        
        // initializing with an array literal
        let c = ["Fred", "Jill", "Biff"]
        print(c)
    }
    
    func testDictionaryWithGenericType() {
        // declare a dictionary with keys of type String and elements of type Any
        var a: Dictionary<String, Any>
        // ...using shorthand syntax
        var b: [String: Any]

        // instantiate a dictionary using generic type syntax
        a = Dictionary<String, Any>()
        // ...using shorthand syntax
        a = [String: Any]()
        // ...or just
        a = [:]
        
        // inserting/modifying elements
        a["name"] = "Fred"
        a["age"] = 29
        
        // using subscript notation to access an element
        // (note that the value will be wrapped in an Optional)
        let age = a["age"]
        
        print(a)
        print(age)
        
        b = [String: Any]()
        print(b)
        
        let c: [String: Any] = ["name": "Fred", "age": 29 ]
        print(c)
        let d = ["min": 0, "max": 80, "average": 42.5]
        print(d)
    }
}
