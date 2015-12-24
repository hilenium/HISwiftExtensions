//
//  NSData.swift
//  Hilenium
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd. All rights reserved.
//

import Foundation

extension NSData {

    var string: String? { return NSString(data: self, encoding: NSUTF8StringEncoding) as String? }
    
}