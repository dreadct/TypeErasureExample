//
//  MainViewController.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, ViewModelBased {

    typealias ViewModelType = MainViewModel

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel: MainViewModel? {
        didSet {
            updateUI()
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

}

// MARK: - UI management

extension MainViewController {

    private func updateUI() {
        guard isViewLoaded else {
            return
        }

        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {

    func numberOfSections() -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.numberOfItemsInSection(atIndex: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            fatalError("\(type(of: self)): no view-model found")
        }

        guard let section = viewModel.section(atIndex: indexPath.section) else {
            fatalError("\(type(of: self)): undefined or unprocessed table view section at index \(indexPath.section)")
        }

        switch section {
        case .dummy:
            return UITableViewCell(style: .default, reuseIdentifier: nil)
        }
    }

}
