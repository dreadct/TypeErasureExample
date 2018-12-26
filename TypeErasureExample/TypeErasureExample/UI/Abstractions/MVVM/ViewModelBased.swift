//
//  ViewModelBased.swift
//  TypeErasureExample
//
//  Created by Vadim Zhilinkov on 26/12/2018.
//  Copyright © 2018 dreadct. All rights reserved.
//

import Foundation

protocol ViewModelBased: class {

    associatedtype ViewModelType: ViewModel

    var viewModel: ViewModelType? { get set }

}
