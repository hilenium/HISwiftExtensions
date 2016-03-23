//
//  Dictionary.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation
/**
 Merge two dictionaries. Values are updated or added to the dictionary on the left.

 - Parameter left: Dictionary 1
 - Parameter right: Dictionary 2
 - Returns: Dictionary
 */
public func += <KeyType, ValueType> (left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
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

    /**
     Recursively changes all `String` dictionary keys from `snake_case` to `camelCase`

     - Returns: New Dictionary
     */
    public func keysToCamelCase() -> Dictionary {

        let keys = Array(self.keys)
        let values = Array(self.values)
        var dict: Dictionary = [:]

        keys.enumerate().forEach { (index, key) in

            var key = key
            var value = values[index]

            if let v = value as? Dictionary, vl = v.keysToCamelCase() as? Value  {
               value = vl
            }

            if let k = key as? String, ky = k.underscoreToCamelCase as? Key {
                key = ky
            }

            dict[key] = value
        }

        return dict
    }

    /**
    Recursively removes all keys where the value is NSNull

    - Returns: New Dictionary
    */
    public func removeNulls() -> Dictionary {

        let keys = Array(self.keys)
        let values = Array(self.values)
        var dict: Dictionary = [:]

        keys.enumerate().forEach { index, key in

            var value = values[index]

            if !(value is NSNull) {
                if let v = value as? Dictionary, val = v.removeNulls() as? Value  {
                    value = val
                }

                dict[key] = value
            }
        }

        return dict
    }


    /**
     Removes keys from a dictionary that are not accessible selectors in an `NSObject` subclass

     - Returns: Dictionary
     */
    public mutating func filterKeys(object: NSObject) -> Dictionary {

        Array(self.keys).forEach {
            if let k = $0 as? String where !object.respondsToSelector(Selector(k)){
                self.removeValueForKey($0)
            }
        }

        return self
    }

}
