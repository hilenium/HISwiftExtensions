//
//  IntTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 26/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.


import Quick
import Nimble
import HISwiftExtensions

class IntSpec: QuickSpec {
    
    override func spec() {
        describe("int extensions") {
            
            it("times") {
                var count = 0
                3.times { count += 1 }
                expect(count).to(equal(3))
            }
            
            it("upto") {
                var int = 0
                int.upto(2) { _ in int += 1 }
                expect(int).to(equal(3))
            }
            
            it("downto") {
                var int = 2
                int.downto(0) { _ in int += 1 }
               expect(int).to(equal(4))
            }
        }
    }
}
