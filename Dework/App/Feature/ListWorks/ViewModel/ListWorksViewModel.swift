//
//  ListWorksViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import RxSwift

class ListWorksViewModel {
    
    typealias updateClosure = (() -> ())
    var updateList: updateClosure?
    fileprivate var repository = JobsRepository()
    
    fileprivate var worksCellViewModel: [ListWorksCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateList?()
            }
        }
    }
    
    public func numberOfRows() -> Int {
        if self.worksCellViewModel.count == 0 {
            self.fetchData()
        }
        
        return self.worksCellViewModel.count
    }
    
    fileprivate func fetchData() {
        repository.getJobs(completion: {
            self.worksCellViewModel = $0.map({ListWorksCellViewModel($0)})
        })
    }
    
    public func cellViewModel(forIndex index: Int) -> ListWorksCellViewModel {
        if index < self.worksCellViewModel.count {
            return self.worksCellViewModel[index]
        }
        return ListWorksCellViewModel(Job(url: "", title: "", body: "", user: User(avatarUrl: "", username: "")))
    }
    
    public func getJob(forIndex index: Int) -> Job {
        let cellVM = cellViewModel(forIndex: index)
        return cellVM.job ?? Job(url: "", title: "", body: "", user: User(avatarUrl: "", username: ""))
    }
}


