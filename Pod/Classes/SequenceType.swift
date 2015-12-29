//
//  Sequence.swift
//  Pods
//
//  Created by Matthew on 29/12/2015.
//
//

import Foundation

public extension SequenceType {
    
    func group<U : Hashable>(@noescape keyFunc: Generator.Element-> U) -> [U:[Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        self.forEach {
            let key = keyFunc($0)
            if case nil = dict[key]?.append($0) { dict[key] = [$0] }
        }
        return dict
    }
}