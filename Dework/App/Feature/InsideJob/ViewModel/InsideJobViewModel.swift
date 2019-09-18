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
    let title: String?
    let publisher: String
    
    init(job: Job) {
        mardownText = job.body
        title = job.title
        publisher = job.user.username ?? ""
    }
    
    public func saveJobToPersistence() {
        let coreDao = CoreDao<FavoriteJob>(with: "Dework")
        let favoriteJob = coreDao.new()
        favoriteJob.title = self.title
        favoriteJob.body = self.mardownText
        favoriteJob.publisher = self.publisher
        coreDao.insert(object: favoriteJob)
    }
}
