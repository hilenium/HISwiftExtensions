//
//  SequenceType.swift
//  HISwiftExtensions
//
//  Created by Matthew on 24/12/2015.
//  Copyright (c) 2015-16 Hilenium Pty Ltd. All rights reserved.
//

import Foundation

public extension SequenceType {
    
    func group<U : Hashable>(@noescape closure: Generator.Element -> U) -> [U:[Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        self.forEach {
            let key = closure($0)
            if case nil = dict[key]?.append($0) { dict[key] = [$0] }
        }
        return dict
    }
}