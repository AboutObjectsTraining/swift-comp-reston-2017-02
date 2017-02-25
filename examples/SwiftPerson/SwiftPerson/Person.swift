//
//  person.swift
//  swiftexercise
//
//  Created by Gregory Reimer on 7/14/15.
//  Copyright (c) 2015 Gregory Reimer. All rights reserved.
//

import Foundation

let SpaceSeperator = " "
let CommaSeperator = ", "

public enum Gender {
    case male
    case female
}

public struct Person: Nameable
{
    public var firstName: String
    
    public var lastName: String
    public var age: Int
    public var gender: Gender
    
    public var middleName: String?
    
    public var fullName: String {
        let components = nameComponents.filter { !$0.isEmpty }
        return components.joined(separator: SpaceSeperator)
    }
    
    public var nameComponents: [String] {
        return [firstName, middleName ?? "", lastName]
    }
    
    public var collationName: String {
        let firstAndMiddleNames = [firstName, middleName ?? "" ]
        let filteredFirstAndMiddleNames = firstAndMiddleNames.filter { !$0.isEmpty }
        let firstAndMiddleName = filteredFirstAndMiddleNames.joined(separator: SpaceSeperator)
        return [lastName, firstAndMiddleName].joined(separator: CommaSeperator)
    }
    
    public init(firstName: String, middleName: String? = .none, lastName: String,
        age: Int = 0, gender: Gender = .female)
    {
        self.firstName = firstName
        self.middleName = middleName
        self.age = age
        self.gender = gender
        
        self.lastName = lastName
    }
}
