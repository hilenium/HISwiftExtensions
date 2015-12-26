//
//  Dictionary.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

public func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

public extension Dictionary {
    public mutating func merge<K, V>(dictionary: [K: V]){
        for (k, v) in dictionary {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}