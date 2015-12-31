//
//  UIViewController.swift
//  Pods
//
//  Created by Matthew on 31/12/2015.
//
//

import UIKit

public extension UIViewController {
    
    public var activityIndicatorTag: Int { return 999999 }
    
    /**
     Creates and starts an UIActivityIndicator in any UIViewController
     
     Parameter style: `UIActivityIndicatorViewStyle` default is .Gray
     Parameter location: `CGPoint` if not specified the `view.center` is applied
     
     */
    public func startActivityIndicator(style: UIActivityIndicatorViewStyle = .Gray, location: CGPoint? = nil) {
        
        let loc = location ?? self.view.center
        
        dispatch_async(dispatch_get_main_queue(), {
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        })
    }
    
    /**
     Stops and removes an UIActivityIndicator in any UIViewController
     */
    public func stopActivityIndicator() {
        
        dispatch_async(dispatch_get_main_queue(), {
            if let activityIndicator = self.view.subviews.filter({ $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        })
    }
}