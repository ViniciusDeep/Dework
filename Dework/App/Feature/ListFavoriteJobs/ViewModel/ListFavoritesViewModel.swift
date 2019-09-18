//
//  ListFavoritesViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

class ListFavoriteViewModel {
    
    typealias updateClosure = () -> ()
    
    var updateList: updateClosure?
    
    let repository = FavoriteRepository()
    
    var listFavoriteCellViewModel: [ListFavoriteCellViewModel] = [] {
        didSet {
            self.updateList?()
        }
    }
    
    fileprivate func fetchData() {
        self.listFavoriteCellViewModel = repository.getFavoriteJobs().map({ListFavoriteCellViewModel($0)})
    }
    
    public func numberOfRows() -> Int {
        if repository.jobsHasChanges() || listFavoriteCellViewModel.count == 0 {
            fetchData()
        }
        return listFavoriteCellViewModel.count
    }
    
    public func cellViewModel(atIndex index: Int) -> ListFavoriteCellViewModel {
        if index < self.listFavoriteCellViewModel.count {
            return self.listFavoriteCellViewModel[index]
        }
        return ListFavoriteCellViewModel(FavoriteJob())
    }
    
    public func didPerformFavoriteToJob(atIndex index: IndexPath) -> Job {
        let cellVM = cellViewModel(atIndex: index.row)
        let favoriteJob = cellVM.favoriteJob
        let job = Job(url: "", title: favoriteJob?.title, body: favoriteJob?.body, user: User(avatarUrl: "", username: ""))
        return job
    }
}
