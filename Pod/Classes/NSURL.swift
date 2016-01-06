//
//  NSURL.swift
//  Pods
//
//  Created by Matthew on 29/12/2015.
//
//

import Foundation

public extension NSURL {

    /**
     Gets the query parameters from an nsurl

     - Returns: An optional dictionary of query parameters

     */
    public var queryParameters: [String: String] {
        var results: [String:String] = [:]
        let keyValues = self.query?.componentsSeparatedByString("&")
        keyValues?.forEach {
            let kv = $0.componentsSeparatedByString("=")
            if kv.count > 1 {
                results[kv[0]] = kv[1]
            }
        }
        return results
    }

    /**
     Failable convenience initializer that accepts an optional string

     - Returns: An NSURL or nil

     */
    public convenience init?(optionalString string: String?) {
        guard let string = string else { return nil }
        self.init(string: string)
    }
}
