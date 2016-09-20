//
//  NSData.swift
//  Hilenium
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd. All rights reserved.
//

import Foundation

public extension Data {
    
    /**
     Converts NSData to a string, if possible
     
     - Returns: String?
     */
    public var string: String? { return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String? }
}
