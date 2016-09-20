//
//  Int.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

public extension Int {
    
    /**
     Performs a closure the given number of times
     
     - Parameter f: The closure
     
     - Returns: Void
     */
    public func times(_ f: () -> () ) {
        for _ in 0..<self {
            f()
        }
    }
    
    /**
     Performs a closure on each int between `self` and `n` (counting up)
     
     - Parameter n: The up to number
     
     - Parameter f: The closure
     
     - Returns: Void
     */
    public func upto(_ n: Int, f: (Int) -> () ) {
        if n < self { return }
        for i in self...n {
            f(i)
        }
    }
    
    /**
     Performs a closure on each int between `self` and `n` (counting down)
     
     - Parameter n: The up to number
     
     - Parameter f: The closure
     
     - Returns: Void
     */
    public func downto(_ n: Int, f: @escaping (Int) -> () ) {
        if n > self { return }
        
        Swift.stride(from: self, through: n, by: -1).forEach {
            f($0)
        }
    }
}
