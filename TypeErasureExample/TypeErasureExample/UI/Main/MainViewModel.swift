//
//  MainViewModel.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

final class MainViewModel: ViewModel {

    typealias Dependencies = ()

    // MARK: - Initializers

    init(dependencies: Dependencies) {
    }

}

// MARK: - SectionedDataSource

extension MainViewModel: SectionedDataSource {

    enum Section: Int, CaseIterable {
        case dummy
    }

    typealias SectionType = Section

    func numberOfItemsIn(section: SectionType) -> Int {
        switch section {
        case .dummy:
            return 0
        }
    }

}
