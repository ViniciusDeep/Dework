//
//  FavoriteRepository.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

struct FavoriteRepository {
    
    fileprivate let coreDao = CoreDao<FavoriteJob>(with: "Dework")
    
    func getFavoriteJobs() -> [FavoriteJob] {
        return coreDao.fetchAll()
    }
    
    func jobsHasChanges() -> Bool {
        if coreDao.context.hasChanges {
            return true
        } else {
            return false
        }
    }
}


