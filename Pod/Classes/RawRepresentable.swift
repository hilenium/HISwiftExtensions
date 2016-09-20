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
        guard let rawValue = rawValue, let value = Self(rawValue: rawValue) else { return nil }
        self = value
    }
}

/**
  Allows a view controller to handle type save segues
 */
public protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

public extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {

    /**
    Performs a type safe segue using the raw value of an enumeration.

     - Parameter segueIdentifier: SegueIdentifier (must be a string)

     - Parameter sender: SegueIdentifier

     */
    public func performSegueWithIdentifier(_ segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }

    /**
     Gets the segueidentifier from the storyboard segue.

     - Parameter segue: UIStoryboardSegue

     - Returns: SegueIdentifier

     */
    public func segueIdentifierForSegue(_ segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid identifier \(segue.identifier).")
        }

        return segueIdentifier
    }
}
