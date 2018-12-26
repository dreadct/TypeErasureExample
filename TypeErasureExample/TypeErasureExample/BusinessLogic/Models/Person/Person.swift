//
//  Person.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

final class Person {

    var gender: Gender?
    var preferredGender: Gender?

}

// MARK: - CustomStringConvertible

extension Person: CustomStringConvertible {

    var description: String {
        return "gender: \(String(describing: gender)), preferredGender: \(String(describing: preferredGender))"
    }

}
