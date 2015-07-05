//
//  NSAttributedString.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

extension NSAttributedString {
    func replaceHTMLTag(tag: String, withAttributes attributes: [String: AnyObject]) -> NSAttributedString {
        let openTag = "<\(tag)>"
        let closeTag = "</\(tag)>"
        let result: NSMutableAttributedString = self.mutableCopy() as! NSMutableAttributedString
        while true {
            let string = result.string as NSString
            let openTagRange = string.rangeOfString(openTag)
            if openTagRange.length == 0 {
                break
            }
            
            let affectedLocation = openTagRange.location + openTagRange.length
            let searchRange = NSMakeRange(affectedLocation, string.length - affectedLocation)
            let closeTagRange = string.rangeOfString(closeTag, options: NSStringCompareOptions(rawValue: 0), range: searchRange)
            
            result.setAttributes(attributes, range: NSMakeRange(affectedLocation, closeTagRange.location - affectedLocation))
            result.deleteCharactersInRange(closeTagRange)
            result.deleteCharactersInRange(openTagRange)
        }
        
        return result as NSAttributedString
    }
}