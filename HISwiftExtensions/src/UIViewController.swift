//
//  UIViewController.swift
//  HISwiftExtensions
//
//  Created by Matthew on 24/12/2015.
//  Copyright (c) 2015-16 Hilenium Pty Ltd. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    private var tag: Int { return 900001 }
    
    public func startActivityIndicator(
        activityIndicatorStyle: UIActivityIndicatorViewStyle = .Gray,
        location: CGPoint? = nil) {
        
        let loc = location != nil ? location! : view.center
        
        dispatch_async(dispatch_get_main_queue(), {
            let activityIndicator = UIActivityIndicatorView(
                activityIndicatorStyle: activityIndicatorStyle)
            activityIndicator.tag = self.tag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        })
    }
    
    public func stopActivityIndicator() {
        
        dispatch_async(dispatch_get_main_queue(), {
            guard let activityIndicator = self.view.subviews.filter({ $0.tag == self.tag})
                .first as? UIActivityIndicatorView else { return }
            
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        })
    }
}