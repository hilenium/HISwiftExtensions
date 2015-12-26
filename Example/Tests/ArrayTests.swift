//
//  ArrayTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 26/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class ArraySpec: QuickSpec {
    
    override func spec() {
        describe("array extension") {
            
            var array: [String]!

            beforeEach {
                array = ["a", "b", "c"]
            }
            
            it("contains") {
                expect(array.contains("a"))
            }

            it("does not contain") {
                expect(!array.contains("d"))
           }
        }
    }
}
