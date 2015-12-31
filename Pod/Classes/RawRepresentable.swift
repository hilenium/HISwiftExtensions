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

public protocol SegueHandlerType {
    typealias SegueIdentifier: RawRepresentable
}

public extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    /**
    Type safe segue using the raw value of an enumeration. A fatal error occurs if the SegueIdentifier enum init does not
     succeed
     
     - Parameter segueIdentifier: SegueIdentifier (must be a string)
     
     - Parameter sender: SegueIdentifier
     
     */
    public func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    
    internal func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid identifier \(segue.identifier).")
        }
        
        return segueIdentifier
    }
}