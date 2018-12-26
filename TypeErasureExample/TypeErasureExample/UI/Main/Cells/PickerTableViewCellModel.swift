//
//  PickerTableViewCellModel.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

final class PickerTableViewCellModel: ViewModel {

    typealias Dependencies = (dataSource: PickerDataSource, title: String)

    // MARK: - Properties

    var dataSource: PickerDataSource
    let title: String

    // MARK: - Initializers

    init(dependencies: Dependencies) {
        dataSource = dependencies.dataSource
        title = dependencies.title
    }

}
