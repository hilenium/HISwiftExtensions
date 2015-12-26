//
//  IntTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 26/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class IntSpec: QuickSpec {
    
    override func spec() {
        describe("int extensions") {
            
            var count = 0
            
            beforeEach {
                count = 0
            }
            
            it("times") {
                3.times { count += 1 }
                expect(count == 3)
            }
            
            it("upto") {
                1.upto(3) { _ in count += 1 }
                expect(count == 3)
            }
            
            it("downto") {
                3.downto(1) { _ in count += 1 }
                expect(count == 3)
            }
        }
    }
}
