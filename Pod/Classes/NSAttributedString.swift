//
//  NSAttributedString.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /**
     Replaces html tags in an attributed string with the given attributes.
     
     - Parameter tag: The tag to replace without opening and closing <> e.g. "strong" = <strong></strong>
     
     - Parameter withAttributes: A dictionary `[String: AnyObject]` of attributes
     
     - Returns: NSAttributedString - the tag replaced by the given attributes.
     */
    public func replaceHTMLTag(_ tag: String, withAttributes attributes: [String: AnyObject]) -> NSAttributedString {
        
        let openTag = "<\(tag)>"
        let closeTag = "</\(tag)>"
        let result: NSMutableAttributedString = self.mutableCopy() as! NSMutableAttributedString
        
        while true {
            let string = result.string as NSString
            let openTagRange = string.range(of: openTag)
            if openTagRange.length == 0 {
                break
            }
            
            let affectedLocation = openTagRange.location + openTagRange.length
            let searchRange = NSMakeRange(affectedLocation, string.length - affectedLocation)
            let closeTagRange = string.range(of: closeTag, options: NSString.CompareOptions(rawValue: 0), range: searchRange)
            
            result.setAttributes(attributes, range: NSMakeRange(affectedLocation, closeTagRange.location - affectedLocation))
            result.deleteCharacters(in: closeTagRange)
            result.deleteCharacters(in: openTagRange)
        }
        
        return result as NSAttributedString
    }
}
