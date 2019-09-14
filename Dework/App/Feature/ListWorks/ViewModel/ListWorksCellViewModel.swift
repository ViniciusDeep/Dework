//
//  ListWorksCellViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

struct ListWorksCellViewModel {
    
    let job: Job?
    
    init(_ job: Job) {
        self.job = job
    }
}
