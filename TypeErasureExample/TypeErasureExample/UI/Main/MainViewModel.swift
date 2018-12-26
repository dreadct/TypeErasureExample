//
//  MainViewModel.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

final class MainViewModel: ViewModel {

    typealias Dependencies = (Person)

    // MARK: - Properties

    private let personCellModels: [PickerTableViewCellModel]

    // MARK: - Initializers

    init(dependencies person: Dependencies) {
        personCellModels = DataProvider.cellModelsForPerson(person)
    }

}

// MARK: - Data provider

extension MainViewModel {

    private enum DataProvider {

        static func cellModelsForPerson(_ person: Person) -> [PickerTableViewCellModel] {
            var cellModels: [PickerTableViewCellModel] = []

            let genderAdapter = GenderAdapter(person, genderKeyPath: \Person.gender)
            let genderTitle = NSLocalizedString("main.table.cells.gender.title",
                                                comment: "Gender")
            cellModels.append(PickerTableViewCellModel(dependencies: (dataSource: genderAdapter,
                                                                      title: genderTitle)))

            let preferredGenderAdapter = GenderAdapter(person, genderKeyPath: \Person.preferredGender)
            let preferredGenderTitle = NSLocalizedString("main.table.cells.preferredGender.title",
                                                         comment: "Preferred gender")
            cellModels.append(PickerTableViewCellModel(dependencies: (dataSource: preferredGenderAdapter,
                                                                      title: preferredGenderTitle)))

            return cellModels
        }

    }

}

// MARK: - SectionedDataSource

extension MainViewModel: SectionedDataSource {

    enum Section: Int, CaseIterable {
        case person
    }

    typealias SectionType = Section

    func numberOfItemsIn(section: SectionType) -> Int {
        switch section {
        case .person:
            return personCellModels.count
        }
    }

    func personCell(at index: Int) -> PickerTableViewCellModel? {
        guard index >= 0,
            index < personCellModels.count else {
            return nil
        }
        return personCellModels[index]
    }

}
