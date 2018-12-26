//
//  SectionedDataSource.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

protocol SectionedDataSource {

    associatedtype SectionType: RawRepresentable, CaseIterable

    // MARK: - Properties

    var allSections: SectionType.AllCases { get }

    // MARK: - Methods

    func numberOfSections() -> Int

    func section(atIndex index: Int) -> SectionType?

    func numberOfItemsIn(section: SectionType) -> Int

    func numberOfItemsInSection(atIndex index: Int) -> Int

    func titleForHeader(section: SectionType) -> String?

    func titleForFooter(section: SectionType) -> String?

}

extension SectionedDataSource where SectionType.RawValue == Int {

    var allSections: SectionType.AllCases {
        return SectionType.allCases
    }

    func numberOfSections() -> Int {
        return allSections.count
    }

    func section(atIndex index: Int) -> SectionType? {
        return SectionType(rawValue: index)
    }

    func numberOfItemsInSection(atIndex index: Int) -> Int {
        guard let section = section(atIndex: index) else {
            return 0
        }
        return numberOfItemsIn(section: section)
    }

    func titleForHeader(section: SectionType) -> String? {
        return nil
    }

    func titleForFooter(section: SectionType) -> String? {
        return nil
    }

}
