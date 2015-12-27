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
    
    /**
     Merges two dictionararies. Values are updated or added to the dictionary on the left.
     
     - Parameter dictionary: The dictionary to merge. with `self`
     
     - Returns: Dictionary
     */
    public mutating func merge<K, V>(dictionary: [K: V]){
        dictionary.forEach { k, v in
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}