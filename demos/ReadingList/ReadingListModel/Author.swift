//
// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

let FirstNameKey = "firstName"
let LastNameKey = "lastName"

open class Author: ModelObject
{
    open var firstName: String?
    open var lastName: String?
    
//    open var fullName: String {
//        switch (firstName, lastName) {
//        case let (first?, last?): return "\(last), \(first)"
//        case let (first?, _):     return first
//        case let (_, last?):      return last
//        default:                  return "Unknown"
//        }
//    }
    
    open var fullName: String {
        guard let firstName = firstName, let lastName = lastName else {
            return ""
        }
        return (firstName + " " + lastName).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    open override var description: String {
        return fullName
    }
    
    override class func keys() -> [String]
    {
        return ["firstName", "lastName"]
    }
}
