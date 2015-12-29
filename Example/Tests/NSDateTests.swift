//
//  NSDateTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 27/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class NSDateExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("nsdate extensions") {
            
            it("comparable true") {
                
                let date1 = NSDate()
                let date2 = date1
                
                expect(date1 == date2).to(equal(true))
            }
            
            it("comparable false") {
                
                let date1 = NSDate()
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
                
                expect(date1 == date2).to(equal(false))
            }
            
            it("add seconds") {
                
                let date1 = NSDate()
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 1, toDate: NSDate(), options: [])
                let date3 = date1.addSeconds(86400)
                
                expect(date2).to(equal(date3))
            }
            
            it("time ago - 1 second ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Second, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 second ago"))
            }
            
            it("time ago - 1 second ago (not numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Second, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("Just now"))
            }
            
            it("time ago - 1 minute ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Minute, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 minute ago"))
            }
            
            it("time ago - 1 minute ago (not numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Minute, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("A minute ago"))
            }
            
            it("time ago - X minutes ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Minute, value: -5, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("5 minutes ago"))
            }
    
            it("time ago - 1 hour ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Hour, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 hour ago"))
            }
            
            it("time ago - 1 hour ago (not numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Hour, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("An hour ago"))
            }
            
            it("time ago - 1 day ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 day ago"))
            }
            
            it("time ago - 1 day ago (not numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("Yesterday"))
            }
            
            it("time ago - 2 days ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("2 days ago"))
            }
            
            it("time ago - 1 week ago (not numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("Last week"))
            }
            
            it("time ago - 1 week ago") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 week ago"))
            }
            
            it("time ago - 1 month ago (numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 month ago"))
            }
            
            it("time ago - 1 month ago (non-numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Month, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("Last month"))
            }
            
            it("time ago - 1 month ago (numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Year, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo()).to(equal("1 year ago"))
            }
 
            it("time ago - 1 year ago (non-numeric)") {
                
                let date2 = NSCalendar.currentCalendar().dateByAddingUnit(.Year, value: -1, toDate: NSDate(), options: [])
                
                expect(date2?.timeAgo(false)).to(equal("Last year"))
            }
        }
    }
}
