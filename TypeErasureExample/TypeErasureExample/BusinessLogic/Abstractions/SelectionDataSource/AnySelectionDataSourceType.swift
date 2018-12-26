//
//  AnySelectionDataSourceType.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

fileprivate extension SelectionDataSourceType {

    func getAllElements() -> [Element] {
        return allElements // implicit self reference
    }

    func getSelectedElement() -> Element? {
        return selectedElement // implicit self reference
    }

    func setSelectedElement(_ element: Element?) {
        selectedElement = element // implicit self reference
    }

}

final class AnySelectionDataSourceType<T>: SelectionDataSourceType {

    // MARK: - Properties

    private var allElementsGetter: () -> [T]
    private var selectedElementGetter: () -> T?
    private var selectedElementSetter: (T?) -> Void

    // MARK: - Initializers

    init<S: SelectionDataSourceType>(_ dataSource: S) where S.Element == T {
        allElementsGetter = dataSource.getAllElements
        selectedElementGetter = dataSource.getSelectedElement
        selectedElementSetter = dataSource.setSelectedElement
    }

    // MARK: - SelectionDataSource

    var allElements: [T] {
        return allElementsGetter()
    }

    var selectedElement: T? {
        get {
            return selectedElementGetter()
        }
        set {
            selectedElementSetter(newValue)
        }
    }

}
