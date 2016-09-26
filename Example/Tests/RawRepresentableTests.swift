////
////  RawRepresentableTests.swift
////  HISwiftExtensions
////
////  Created by Matthew on 31/12/2015.
////  Copyright © 2015 CocoaPods. All rights reserved.
////

import Quick
import Nimble
import HISwiftExtensions

class RawRepresentativeExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("raw representable extension") {
            
            enum Test: Int {
                case success
            }
            
            it("init optionalRawValue") {
                
                let value: Int? = 1
                let test = Test(optionalRawValue: value)
                expect(test).to(equal(Test.success))
            }
            
            it("init optionalRawValue nil"){
                let value: Int? = nil
                let test = Test(optionalRawValue: value)
                expect(test).to(beNil())
            }
        }
    }
}
