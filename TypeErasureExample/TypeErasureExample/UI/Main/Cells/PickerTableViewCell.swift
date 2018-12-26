//
//  PickerTableViewCell.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import UIKit

final class PickerTableViewCell: UITableViewCell, ViewModelBased {

    typealias ViewModelType = PickerTableViewCellModel

    // MARK: - Properties

    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()

    var viewModel: PickerTableViewCellModel? {
        didSet {
            updateUI()
        }
    }

    var updateTableLayoutClosure: (() -> Void)?

}

// MARK: - UIResponder

extension PickerTableViewCell {

    override var canBecomeFirstResponder: Bool {
        return viewModel != nil
    }

    override var inputView: UIView? {
        return pickerView
    }

}

// MARK: - UI management

extension PickerTableViewCell {

    private func updateUI() {
        pickerView.reloadAllComponents()

        guard let viewModel = viewModel else {
            textLabel?.text = nil
            detailTextLabel?.text = nil
            return
        }
        textLabel?.text = viewModel.title

        if let displayString = viewModel.dataSource.selectedPickerValue?.displayString {
            detailTextLabel?.text = displayString
        } else {
            detailTextLabel?.text = NSLocalizedString("main.table.cells.unspecifiedValue", comment: "Unspecified")
        }
    }

}

// MARK: - UIPickerViewDataSource

extension PickerTableViewCell: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let dataSource = viewModel?.dataSource else {
            return 0
        }
        return dataSource.allPickerValues.count
    }

}

// MARK: - UIPickerViewDelegate

extension PickerTableViewCell: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let dataSource = viewModel?.dataSource,
            row >= 0,
            row < dataSource.allPickerValues.count else {
            return nil
        }
        return dataSource.allPickerValues[row].displayString
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let dataSource = viewModel?.dataSource,
            row >= 0,
            row < dataSource.allPickerValues.count else {
            return
        }

        let selectedPickerValue = dataSource.allPickerValues[row]
        dataSource.selectedPickerValue = selectedPickerValue
        detailTextLabel?.text = selectedPickerValue.displayString
        updateTableLayoutClosure?()
    }

}
