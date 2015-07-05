//
//  Array.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

extension Array {
    func contains<T where T : Equatable>(object: T) -> Bool {
        return self.filter({$0 as? T == object}).count > 0
    }
}