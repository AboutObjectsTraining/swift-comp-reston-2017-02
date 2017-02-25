//
//  PersonUnitTests.swift
//  PersonUnitTests
//
//  Created by Gregory Reimer on 7/14/15.
//  Copyright (c) 2015 Gregory Reimer. All rights reserved.
//

import XCTest
@testable SwiftPerson

let TotalAge: Int = 193
let AverageAge: Int = 32
let MinorAge: Int = 20
let Comma  =  ",  "

let People =  [
    Person(firstName: "Fred", lastName: "Smith", age: 32, gender: .male),
    Person(firstName: "Mary", middleName: "Jane", lastName: "Smith", age: 30, gender: .female),
    Person(firstName: "Robert", middleName: "Walker", lastName: "Smith", age: 3, gender: .male),
    Person(firstName: "Katelyn", middleName: "Jane", lastName: "Walker", age: 70, gender: .female),
    Person(firstName: "John", lastName: "Jones", age: 14, gender: .male),
    Person(firstName: "Janet", lastName: "Jones", age: 44, gender: .female)
]


class PersonTests:  XCTestCase
{
    override func setUp() {
        super.setUp()
        print("")
    }
    
    override func tearDown() {
        print("")
        super.tearDown()
    }
    
    // Demonstrates use of `reduce` method to compute total age
    // for an array of type Person.
    //
    func testAge()
    {
        let totalAge = People.reduce(0) { total, person in
            total + person.age
        }
        
        XCTAssertEqual(TotalAge, totalAge)
        
        let average = totalAge / People.count
        
        XCTAssertEqual(AverageAge, average)
    }
    
    
    // Demonstrates the use of the Array type's `filter` method, which returns
    // an array of objects matching the condition specified by the trailing
    // closure argument.
    //
    func testFilters()
    {
        // produces an array filtered by age
        let adults = People.filter { $0.age > MinorAge }
        
        // produces an array filtered by gender
        let men = People.filter { $0.gender == Gender.male }
        
        // produces a list of full names
        let mensNames = men.map { return $0.fullName }
        
        // prints a comma-separated string of names
        print(mensNames.joined(separator: Comma))
        
        // prints a semicolon-separated string of formatted names
        //
        let formattedNames = men.map { $0.collationName }.joined(separator: "; ")
        print(formattedNames)
    }
    
    // Uses `map` as well as custom methods to transform an array of type
    // Person into a dictionary of arrays of Person keyed by last name.
    //
    func testTransforms()
    {
        let lastNames = People.map { person -> String in person.lastName }
        let uniqueNames = uniqueElements(lastNames)
        
        XCTAssert(uniqueNames.count == 3, "There should be 3 unique last names")
        
        let personsDict = elementsIndexedByLastName(People)
        let peopleNamedSmith = personsDict["Smith"]!
        
        let fullNames = peopleNamedSmith.map { $0.fullName }.joined(separator: Comma)
        print(fullNames)
        
        XCTAssertNotEqual(peopleNamedSmith.count, 0, "There should be 3 people with the last name 'Smith'")
    }
}
