//
//  NSAttributedStringTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 26/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//
//
import Quick
import Nimble
import HISwiftExtensions

class NSAttributedStringSpec: QuickSpec {
    
    override func spec() {
        describe("nsattributed string extensions") {
            
            let attrString = NSMutableAttributedString(string: "<strong>hello</strong> world")
            
            it("replaceHTML") {
                
                let _ = attrString.replaceHTMLTag("strong", withAttributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)])
                expect(attrString.string == "hello world")
                
                for i in 0...5 {
                   expect(attrString.attributes(at: i, effectiveRange: nil)[NSFontAttributeName])
//                    .to(equal(UIFont.boldSystemFontOfSize(20)))
                }
                
                for i in 6...10 {
                    expect(attrString.attributes(at: i, effectiveRange: nil)[NSFontAttributeName])
//                        .toNot(equal(UIFont.boldSystemFontOfSize(20)))
                }
            }
        }
    }
}
