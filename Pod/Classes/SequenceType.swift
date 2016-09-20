//
//  Sequence.swift
//  Pods
//
//  Created by Matthew on 29/12/2015.
//
//

import Foundation

public extension Sequence {
    
    /**
     Groups a sequence by applying a closure to each element
     
     - Parameter closure: The closure to apply to each element
     
     - Returns: Dictionary grouping the original input but the closure return value
     
     */
    public func group<U : Hashable>(_ closure: (Iterator.Element)-> U) -> [U:[Iterator.Element]] {
        var dict: [U:[Iterator.Element]] = [:]
        self.forEach {
            let key = closure($0)
            if case nil = dict[key]?.append($0) { dict[key] = [$0] }
        }
        return dict
    }
}
