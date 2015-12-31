//
//  Sequence.swift
//  Pods
//
//  Created by Matthew on 29/12/2015.
//
//

import Foundation

public extension SequenceType {
    
    /**
     Groups a sequence by applying a closure to each element
     
     - Parameter closure: The closure to apply to each element
     
     - Returns: Dictionary grouping the original input but the closure return value
     
     */
    public func group<U : Hashable>(@noescape closure: Generator.Element-> U) -> [U:[Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        self.forEach {
            let key = closure($0)
            if case nil = dict[key]?.append($0) { dict[key] = [$0] }
        }
        return dict
    }
}