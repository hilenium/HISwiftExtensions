//
//  Array.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

public extension Array {
    
    /**
     Determines if an array contains a givenelement
     
     - Parameter object: The element to check if it is contained in the array.
     
     - Returns: Bool
     */
     public func contains<T:Equatable>(object: T) -> Bool {
        return self.filter( {$0 as? T == object} ).count > 0
    }
}