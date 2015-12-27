//
//  DictionaryTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 26/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class DictionaryExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("dictionary extensions") {
            
            var a: [String: String]!
            var b: [String: String]!
            
            beforeEach {
                a = ["a" : "a"]
                b = ["b" : "b"]
            }
            
            it("merge") {
                a.merge(b)
                expect(a["a"]).to(equal("a"))
                expect(a["b"]).to(equal("b"))
            }
        }
    }
}