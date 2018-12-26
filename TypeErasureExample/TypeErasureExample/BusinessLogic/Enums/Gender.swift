//
//  Gender.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

enum Gender: CaseIterable {
    case female
    case helisexual
    case male
}

// MARK: - StringDisplayable

extension Gender: StringDisplayable {

    var displayString: String {
        switch self {
        case .female:
            return NSLocalizedString("enums.gender.female", comment: "Female")
        case .helisexual:
            return NSLocalizedString("enums.gender.helisexual", comment: "Helisexual")
        case .male:
            return NSLocalizedString("enums.gender.male", comment: "Male")
        }
    }

}
