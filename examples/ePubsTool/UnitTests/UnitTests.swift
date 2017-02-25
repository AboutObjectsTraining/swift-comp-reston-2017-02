//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

class UnitTests: XCTestCase
{
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSearchPublications()
    {
        let expectation = self.expectation(description: "Expected json to be non-nil")
        
        do {
            try PublicationsStoreController.mainQueueController.search("Core Data") { (json) in
                print(json)
                if json == nil { XCTFail(expectation.description) }
                expectation.fulfill()
            }
        }
        catch let error {
            print(error)
        }
        
        waitForExpectations(timeout: 1) { (error) in
            print(error)
            XCTFail("iTunes query failed with error \(error)")
        }
    }
}
