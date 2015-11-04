//
//  Int.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

public extension Int {
    
    func times(f: () -> () ) {
        for _ in 0..<self {
            f()
        }
    }
    
    func upto(n: Int, f: (Int) -> () ) {
        for i in self...n {
            f(i)
        }
    }
    func downto(n: Int, f: (Int) -> () ) {
        for i in stride(through: self, by: -1) {
            f(i)
        }
    }
}
