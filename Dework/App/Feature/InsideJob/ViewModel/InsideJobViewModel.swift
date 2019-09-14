//
//  InsideJobViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct InsideJobViewModel {
    
    let mardownText: String?
    
    init(job: Job) {
        mardownText = job.body
    }
}