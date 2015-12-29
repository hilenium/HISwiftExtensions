//
//  SequenceTypeTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 29/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class SequenceTypeSpec: QuickSpec {
    
    override func spec() {
        describe("sequence type extensions") {
            
            it("group") {
                
                let data = [
                    ["name": "foo"],
                    ["name": "foo"],
                    ["name" : "bar"]
                ]
                
                let dict = data.group { $0["name"]! }
                
                expect(dict["foo"]!.count).to(equal(2))
                expect(dict["bar"]!.count).to(equal(1))
            }
           
        }
    }
}

