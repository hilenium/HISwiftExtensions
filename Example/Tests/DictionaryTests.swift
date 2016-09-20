//
//  DictionaryTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 26/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//
//
//import Quick
//import Nimble
//import HISwiftExtensions
//
//class DictionaryExtensionsSpec: QuickSpec {
//    
//    override func spec() {
//        describe("dictionary extensions") {
//            
//            it("merge") {
//                
//                var a = ["a" : "a"]
//                let b = ["b" : "b"]
//
//                a.merge(b)
//                expect(a["a"]).to(equal("a"))
//                expect(a["b"]).to(equal("b"))
//            }
//            
//            it("keys to camelcase") {
//               
//                let d = [
//                    "a_property" : [
//                        "nested_property" : "foo"
//                    ]
//                ]
//                
//                let dict = d.keysToCamelCase()
//                expect(Array(dict.keys).first).to(equal("aProperty"))
//                expect(Array(dict["aProperty"]!.keys).first).to(equal("nestedProperty"))
//            }
//            
//            it("remove nsnulls") {
//                
//                let d: [String: AnyObject] = [
//                    "null_property" : NSNull(),
//                    "a_property" : "a",
//                    "nested": [
//                        "null_property" : NSNull(),
//                        "a_property" : "a",
//                    ]
//                ]
//                
//                let dict = d.removeNulls()
//                expect(Array(dict.keys).first).to(equal("a_property"))
//                let nested = dict["nested"] as! [String: AnyObject]
//                expect(Array(nested.keys).first).to(equal("a_property"))
//            }
//
//            
//            it("filter keys") {
//                
//                class Test: NSObject {
//                    var a: AnyObject?
//                    var b: AnyObject?
//                }
//                
//                var dict = [
//                    "a" : "foo",
//                    "b" : "bar",
//                    "c" : "foobar",
//                ]
//                
//                dict.filterKeys(Test())
//                
//                let keys = Array(dict.keys)
//                expect(keys.contains("a")).to(equal(true))
//                expect(keys.contains("b")).to(equal(true))
//                expect(keys.contains("c")).to(equal(false))
//            }
//
//        }
//    }
//}
