//
//  Utilities.swift
//  ExerciseMain
//
//  Created by Gregory Reimer on 7/15/15.
//  Copyright (c) 2015 Gregory Reimer. All rights reserved.
//


/// Initializes an instance of Set with the contents of the array,
/// and returns the resulting values as an array of unique elements.
///
func uniqueElements <T: Hashable> (_ elements: [T]) -> [T]
{
    let uniqueElems = Set(elements)
    
    return Array(uniqueElems)
}


/// Returns a dictionary containing arrays of Nameables keyed by last name.
///
/// - parameter namedObjects: A collection of Nameables
/// - returns: a dictionary of type `T` keyed by String
///
public func elementsIndexedByLastName <T: Nameable> (_ nameables: [T]) -> [String: [T]]
{
    let lastNames = nameables.map { currObj -> String in
        
        // It seems odd that this code fails without the cast. I'm guessing
        // that otherwise the compiler doesn't see the protocol witness
        // table for Nameable, although LLDB apparently does.
        //
        // Until we fully understand what's going on here, this probably isn't an
        // example we'd want to use.
        //
        let obj = currObj as Nameable
        
        return obj.lastName
    }
    
    var elementsByLastName = [String: [T]]()
    let uniqueLastNames = uniqueElements(lastNames)
    
    for lastName in uniqueLastNames {
        let filteredObjs = nameables.filter { currObj in
            currObj.lastName == lastName
        }
        elementsByLastName.updateValue(filteredObjs, forKey: lastName)
    }
    
    return elementsByLastName
}
