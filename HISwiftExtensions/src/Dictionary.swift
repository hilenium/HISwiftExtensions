//
//  Dictionary.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright (c) 2015-16 Hilenium Pty Ltd. All rights reserved.
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
    
    public func keysToCamelCase() -> Dictionary {
        
        let keys = Array(self.keys)
        let values = Array(self.values)
        var dict: Dictionary = [:]
        
        keys.enumerate().forEach { (let index, var key) in
            
            var value = values[index]
            if let v = value as? Dictionary, vl = v.keysToCamelCase() as? Value {
                value = vl
            }
            
            if let k = key as? String, ky = k.underscoreToCamelCase as? Key {
                key = ky
            }
            
            dict[key] = value
        }
        
        return dict
    }

}