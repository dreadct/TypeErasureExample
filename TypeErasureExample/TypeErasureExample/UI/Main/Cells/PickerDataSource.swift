//
//  PickerDataSource.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

protocol PickerDataSource: class {

    // MARK: - Properties

    var allPickerValues: [StringDisplayable] { get }
    var selectedPickerValue: StringDisplayable? { get set }

}

// MARK: - GenderAdapter extension

extension GenderAdapter: PickerDataSource {

    var allPickerValues: [StringDisplayable] {
        return Gender.allCases
    }

    var selectedPickerValue: StringDisplayable? {
        get {
            return gender
        }
        set {
            gender = newValue as? Gender
        }
    }

}
