//
//  Array.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright (c) 2015-16 Hilenium Pty Ltd. All rights reserved.
//

import Foundation

public extension Array {
     public func contains<T:Equatable>(object: T) -> Bool {
        return self.filter( {$0 as? T == object} ).count > 0
    }
}