//
//  UIViewControllerTests.swift
//  HISwiftExtensions
//
//  Created by Matthew on 31/12/2015.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import HISwiftExtensions

class UIViewControllerExtensionsSpec: QuickSpec {
    
    override func spec() {
        describe("uiviewcontroller extension") {
            
            var vc: UIViewController!
            var activityIndicator: UIActivityIndicatorView?
            
            beforeEach {
                vc = UIViewController()
                vc.startActivityIndicator()
                activityIndicator = vc.view.subviews.filter({ $0.tag == vc.activityIndicatorTag }).first as?UIActivityIndicatorView
            }
            
            it("start activity indicator") {
                expect(activityIndicator?.isAnimating()).to(equal(true))
            }
            
            it("stop activity indicator"){
                vc.stopActivityIndicator()
                expect(activityIndicator).to(equal(nil))
            }
        }
    }
}
