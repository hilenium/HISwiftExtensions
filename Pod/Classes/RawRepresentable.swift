//
//  RawRepresentable.swift
//  Pods
//
//  Created by Matthew on 31/12/2015.
//
//
import Foundation

public extension RawRepresentable {
    
    /**
     Failable initializer that accepts an optional parameter
     
     - Parameter optionalRawValue: optional RawValue
     
     - Returns: nil or the raw representable object
     
     */
    public init?(optionalRawValue rawValue: RawValue?) {
        guard let rawValue = rawValue, value = Self(rawValue: rawValue) else { return nil }
        self = value
    }
}