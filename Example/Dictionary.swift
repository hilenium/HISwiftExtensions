//
//  Dictionary.swift
//  HISwiftExtensions
//
//  Created by Matthew on 6/07/2015.
//  Copyright © 2015 Hilenium Pty Ltd.. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge<K, V>(dictionary: [K: V]){
        for (k, v) in dictionary {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}