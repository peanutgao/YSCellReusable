//
//  UICollection+Reusable.swift
//  PinjamDult
//
//  Created by Joseph Koh on 2023/10/16.
//

import UIKit

import UIKit

public extension UICollectionView {
    /// Register a Class-Based `UICollectionViewCell` subclass (conforming to Reusable)
    func register(cellType: (some UICollectionViewCell & Reusable).Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Register a Class-Based `UICollectionReusableView` subclass (conforming to Reusable) as a section header
    func registerHeader(headerType: (some UICollectionReusableView & Reusable).Type) {
        register(
            headerType.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: headerType.reuseIdentifier
        )
    }

    /// Register a Class-Based `UICollectionReusableView` subclass (conforming to Reusable) as a section footer
    func registerFooter(footerType: (some UICollectionReusableView & Reusable).Type) {
        register(
            footerType.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: footerType.reuseIdentifier
        )
    }

    /// Dequeue a reusable `UICollectionViewCell` object for the class inferred by the return-type
    func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath,
                                                         as cellType: Cell.Type = Cell.self) -> Cell
        where Cell: Reusable
    {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            preconditionFailure(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). " +
                    "Check that you registered the cell beforehand"
            )
        }
        return cell
    }

    /// Dequeue a reusable `UICollectionReusableView` object for the class inferred by the return-type
    func dequeueReusableSupplementaryView<View: UICollectionReusableView>(
        ofKind kind: String,
        as viewType: View.Type = View.self
    ) -> View? where View: Reusable {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: View.reuseIdentifier,
            for: IndexPath()
        ) as? View else {
            preconditionFailure(
                "Failed to dequeue a supplementary view with identifier \(viewType.reuseIdentifier) matching type \(viewType.self). " +
                    "Check that you registered the supplementary view beforehand"
            )
        }
        return view
    }
}
