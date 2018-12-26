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
        setupUI()
        setupViewModel()
//        updateUI()
    }

}

// MARK: - UI management

extension MainViewController {

    private enum VisualMetrics {
        static let estimatedRowHeight: CGFloat = 100.0
    }

    private func setupViewModel() {
        let person = Person()
        viewModel = MainViewModel(dependencies: person)
    }

    private func setupUI() {
        setupTableView()
    }

    private func setupTableView() {
        registerTableCells()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = VisualMetrics.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func registerTableCells() {
        tableView.register(cellType: PickerTableViewCell.self)
    }

    private func updateUI() {
        guard isViewLoaded,
            viewModel != nil else {
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
        case .person:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PickerTableViewCell.self)
            cell.viewModel = viewModel.personCell(at: indexPath.row)
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? PickerTableViewCell else { return }
        cell.updateTableLayoutClosure = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.updateTableLayout()
        }
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let cell = tableView.cellForRow(at: indexPath) as? PickerTableViewCell else {
            return indexPath
        }
        cell.becomeFirstResponder()
        return indexPath
    }

    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let cell = tableView.cellForRow(at: indexPath) as? PickerTableViewCell else {
            return indexPath
        }
        cell.resignFirstResponder()
        return indexPath
    }

}
