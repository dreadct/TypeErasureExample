//
//  GenderAdapter.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

final class GenderAdapter<T> {

    // MARK: - Properties

    var gender: Gender? {
        get {
            return genderContainer[keyPath: genderKeyPath]
        }
        set {
            genderContainer[keyPath: genderKeyPath] = newValue
        }
    }
    private var genderContainer: T
    private let genderKeyPath: WritableKeyPath<T, Gender?>

    // MARK: - Initializers

    init(_ genderContainer: T, genderKeyPath: WritableKeyPath<T, Gender?>) {
        self.genderContainer = genderContainer
        self.genderKeyPath = genderKeyPath
    }

}
