//
//  Extensions.swift
//  Hilenium
//
//  Created by Matthew on 15/02/2015.
//  Copyright (c) 2015 PHilenium Pty Ltd. All rights reserved.
//

import UIKit

public extension String {
    
    /**
     Sets the first character in a string to uppercase.
     
     - Returns: String
     
     */
    public var uppercaseFirst: String {
        let first = self.startIndex
        let rest = first.advancedBy(1)..<self.endIndex
        return String(self[first]).uppercaseString + self[rest]
        
    }
    
    /**
     Removes white spaces from a string.
     
     - Returns: String
     
     */
    public var trim: String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    /**
     Truncates a string and appends trailing characters if the number of characters in the string exceeds truncated length

     - Parameter length: int the number of characters from the start where the trucation occurs

     - Parameter trailing: string to append to the end of the turncation (if required). Defaults to `...`
     
     - Returns: String
     
     */
    public func truncate(length: Int, trailing: String? = "...") -> String {
        
        return self.characters.count > length
            ? self.substringToIndex(self.startIndex.advancedBy(length)) + (trailing)!
            : self
    }
    
    /**
     Url encodes a string
     
     */
    public var urlEncode: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    /**
     Splits a string into an array by the given delimiter
     
     - Parameter delimiter: string to use as the splitter
     
     - Returns: [String]
     
     */
    public func split(delimiter: String) -> [String] {
        return self.componentsSeparatedByString(delimiter)
    }
    
    /**
     Determines if a string is a valid email address
     
     - Returns: Bool
     
     */
    public var isValidEmail:Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    
    /**
     Counts the number of charaters in a string
     
     - Returns: Int - the number of characters
     
     */
    public var count:Int { return self.characters.count }
    
    /**
     Converts a string to NSDate if possible
     
     - Parameter format: the date format. The default is ISO `yyyy-MM-dd'T'HH:mm:ssZZZZ`
     
     - Returns: NSDate?
     
     */
    public func toDate(format:String = "yyyy-MM-dd'T'HH:mm:ssZZZZ") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
    
    public func boldStrongTags(size:CGFloat, color:UIColor = UIColor.blackColor()) -> NSAttributedString {
        
        let attributes = [NSFontAttributeName : UIFont.systemFontOfSize(size), NSForegroundColorAttributeName : color]
        let attributed = NSMutableAttributedString(string: self)
        return attributed.replaceHTMLTag("strong", withAttributes: attributes)
    }
    
    /**
     Subscript a string e.g. "foo"[0] == "f"
     
     - Returns: Character
     
     */
    public subscript (i: Int) -> Character {
        return Array(self.characters)[i]
    }
    
    /**
     Removes all html from a string
     
    - Returns: String?
     
     */
    public var stripHTML: String? {
        
        let encodedData = self.dataUsingEncoding(NSUTF8StringEncoding)!
        let attributedOptions:[String: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
        ]
        
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            return attributedString.string
        }
        catch {
            return nil
        }
    }
}

