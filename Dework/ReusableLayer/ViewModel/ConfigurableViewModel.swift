//
//  ConfigurableViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import RxSwift

protocol ConfigurableViewModel {
    typealias UpdateClosure = () -> ()
    associatedtype Repository
    var updateList: UpdateClosure? {get set}
}
