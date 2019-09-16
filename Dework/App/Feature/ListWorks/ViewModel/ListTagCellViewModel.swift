//
//  ListTagCellViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct ListTagCellViewModel {
    
    let dogTag: DogTag?
    
    
    init(_ dogTag: DogTag) {
        self.dogTag = dogTag
    }
}
