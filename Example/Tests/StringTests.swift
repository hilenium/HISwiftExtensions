//
//  StringTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 27/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class StringExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("string extensions") {
            
            it("uppercase first") {
                let s = "foo"
                let u = s.uppercaseFirst
                expect(u.characters.first).to(equal("F"))
                expect(Array(u.characters)[1]).to(equal("o"))
                expect(Array(u.characters)[2]).to(equal("o"))
            }
            
            it("trim") {
                
                let s = " foo "
                let t = s.trim
                expect(t).to(equal("foo"))
            }

            it("truncate shorter than length of string") {
                
                let s = "this is a string"
                let t = s.truncate(4)
                expect(t).to(equal("this..."))
            }
            
            it("truncate length of string") {
                
                let s = "this is a string"
                let t = s.truncate(16)
                expect(t).to(equal(s))
            }
            
            it("url encode") {
                
                let s = "the string"
                let u = s.urlEncode
                expect(u).to(equal("the%20string"))
            }
            
            it("split") {
                
                let s = "the-string"
                let u = s.split("-")
                expect(u).to(equal(["the", "string"]))
            }
            
            it("is valid email") {
                
                let s = "matt@hilenium.com"
                expect(s.isValidEmail).to(equal(true))
            }
            
            it("is not valid email") {
                
                let s = "hilenium.com"
                expect(s.isValidEmail).to(equal(false))
            }
            
            it("count") {
                
                let s = "string"
                expect(s.count).to(equal(6))
            }
            
            it("to date") {
                
                let s = "2000-01-01T00:00:00+00:00"
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
                let date = dateFormatter.dateFromString(s)
                
                expect(s.toDate()).to(equal(date))
            }
            
            it("subscript") {

                expect("foo"[0]).to(equal("f"))
            }
            
            it("strip") {
                
                let html = "<p>hello</p>"
                let string = html.stripHTML
                expect(string).to(equal("hello"))
                
            }
        }
    }
}