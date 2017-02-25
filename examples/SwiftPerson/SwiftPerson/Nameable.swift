//
//  Nameable.swift
//  swiftexercise
//
//  Created by Gregory Reimer on 7/14/15.
//  Copyright (c) 2015 Gregory Reimer. All rights reserved.
//

import Foundation

public protocol Nameable
{
    var firstName: String        { get set }
    var middleName: String?      { get set }
    var lastName: String         { get set }
    
    var fullName: String         { get }
    var nameComponents: [String] { get }
    var collationName: String    { get }
}
