//
//  SelectionDataSourceType.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

protocol SelectionDataSourceType: class {

    associatedtype Element

    // MARK: - Properties

    var allElements: [Element] { get }

    var selectedElement: Element? { get set }

}
