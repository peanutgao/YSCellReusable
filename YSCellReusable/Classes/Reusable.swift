//
//  Reusable.swift
//  PinjamDult
//
//  Created by Joseph Koh on 2023/10/16.
//

import UIKit

// MARK: - Reusable

/// Make your `UlTableViewCell` and `UICollectionViewcell` subclasses
/// conform to this protocol when they are *not* NIB-based but only code-based
/// to be able to dequeue them in a type-safe manner
public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {
    /// By default, use the name of the class as String for its reuseldentifier
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
