////
////  NSURLTests.swift
////  HISwiftExtensions
////
////  Created by Matthew on 29/12/2015.
////  Copyright © 2015 CocoaPods. All rights reserved.
////
//
import Quick
import Nimble
import HISwiftExtensions
//
//class NSURLSpec: QuickSpec {
//    
//    override func spec() {
//        describe("nsurl extensions") {
//            
//            it("query parameters") {
//            
//                let url = NSURL(string: "http://foo.com?foo=bar&bar=foo")
//                let dict = url?.queryParameters
//                
//                expect(dict?["foo"]!).to(equal("bar"))
//                expect(dict?["bar"]!).to(equal("foo"))
//            }
//            
//            it("failable convenience initializer - successful") {
//                
//                let string: String? = "http://foo.com"
//                let url = NSURL(optionalString: string)
//                
//                expect(url).toNot(equal(.none))
//            }
//            
//            it("failable convenience initializer - failure") {
//                
//                let string: String? = "foo"
//                let url = NSURL(optionalString: string)
//                
//                expect(url).to(equal(.none))
//            }
//        }
//    }
//}
//
