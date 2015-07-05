//
//  Extensions.swift
//  Hilenium
//
//  Created by Matthew on 15/02/2015.
//  Copyright (c) 2015 PHilenium Pty Ltd. All rights reserved.
//

import UIKit

extension String {
    
    var urlEncode: String {
        return self.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
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
    
    func boldStrongTags() -> NSAttributedString {
        let attributes = [NSFontAttributeName : UIFont.boldSystemFontOfSize(12)]
        let attributed = NSAttributedString(string: self)
        return attributed.replaceHTMLTag("strong", withAttributes: attributes)
    }
    
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}

