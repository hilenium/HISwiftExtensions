//
//  UIViewController.swift
//  Pods
//
//  Created by Matthew on 31/12/2015.
//
//

import UIKit

public extension UIViewController {

   /**
    Property used to identify the activity indicator. Default valye is `999999`
    but this can be overridden.
    */
    public var activityIndicatorTag: Int { return 999999 }

    /**
     Creates and starts an UIActivityIndicator in any UIViewController

     Parameter style: `UIActivityIndicatorViewStyle` default is .Gray
     Parameter location: `CGPoint` if not specified the `view.center` is applied

     */
    public func startActivityIndicator(_ style: UIActivityIndicatorViewStyle = .gray, location: CGPoint? = nil) {

        let loc = location ?? self.view.center

        DispatchQueue.main.async(execute: {
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

        DispatchQueue.main.async(execute: {
            if let activityIndicator = self.view.subviews.filter({ $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        })
    }
}
