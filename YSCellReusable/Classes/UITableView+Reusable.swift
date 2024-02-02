//
//  UITableView+Reusable.swift
//  PinjamDult
//
//  Created by Joseph Koh on 2023/10/16.
//

import UIKit

extension UITableView {
    /// Register a Class-Based `UITableViewCell` subclass (conforming to Reusable)
    public func register(cellType: (some UITableViewCell & Reusable).Type) {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Register a Class-Based `UITableViewHeaderFooterView` subclass (conforming to Reusable)
    public func register(headerFooterViewType: (some UITableViewHeaderFooterView & Reusable).Type) {
        register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    // Dequeue a reusable `UITableViewCell` object for the class inferred by the return-type
    public func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath, as cellType: Cell.Type = Cell.self) -> Cell where Cell: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            preconditionFailure(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). ",
                file: "Check that you registered the cell beforehand"
            )
        }
        return cell
    }

    /// Dequeue a reusable `UITableViewHeaderFooterView` object for the class inferred by the return-type I
    public func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(as viewType: View.Type = View.self) -> View? where View: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: View.reuseIdentifier) as? View? else {
            preconditionFailure(
                "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) matching type\(viewType.self)"
                    + "Check that you registered the header/footer beforehand"
            )
        }
        return view
    }
}
