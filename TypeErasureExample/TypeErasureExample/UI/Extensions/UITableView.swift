//
//  UITableView.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import UIKit

extension UITableView {

    // MARK: - Methods

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        let reuseIdentifier = String(describing: cellType)
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue a cell")
        }
        return cell
    }

    func register<T: UITableViewCell>(cellType: T.Type) {
        let reuseIdentifier = String(describing: cellType)
        let nib = UINib(nibName: reuseIdentifier, bundle: Bundle(for: cellType))
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

    func updateTableLayout() {
        if #available(iOS 11.0, *) {
            performBatchUpdates(nil, completion: nil)
        } else {
            beginUpdates()
            endUpdates()
        }
    }

}
