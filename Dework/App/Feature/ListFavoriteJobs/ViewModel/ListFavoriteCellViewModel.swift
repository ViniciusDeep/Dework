//
//  ListFavoriteCellViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

struct ListFavoriteCellViewModel {
    let favoriteJob: FavoriteJob?
    
    init(_ favoriteJob: FavoriteJob) {
        self.favoriteJob = favoriteJob
    }
}
