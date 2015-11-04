//
//  Extensions.swift
//  Hilenium
//
//  Created by Matthew on 15/02/2015.
//  Copyright (c) 2015 PHilenium Pty Ltd. All rights reserved.
//

import UIKit

public extension String {
    
    var uppercaseFirst: String {
    
        let first = self.startIndex
        let rest = first.advancedBy(1)..<self.endIndex
        return String(self[first]).uppercaseString + self[rest]
        
    }
    
    var trim: String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    func truncate(length: Int, trailing: String? = "...") -> String {
        
        return self.characters.count > length
            ? self.substringToIndex(self.startIndex.advancedBy(length)) + (trailing)!
            : self
    }
    
    var urlEncode: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    func split(delimiter: String) -> [String] {
        return self.componentsSeparatedByString(delimiter)
    }
    
    var isValidEmail:Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    
    var count:Int { return self.characters.count }
    
    func toDate(format:String = "yyyy-MM-dd'T'HH:mm:ssZZZZ") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
    
    func boldStrongTags(size:CGFloat, color:UIColor = UIColor.blackColor()) -> NSAttributedString {
        
        let attributes = [NSFontAttributeName : UIFont.systemFontOfSize(size), NSForegroundColorAttributeName : color]
        let attributed = NSMutableAttributedString(string: self)
        return attributed.replaceHTMLTag("strong", withAttributes: attributes)
    }
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
    
    var stripHTML: String? {
        
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

