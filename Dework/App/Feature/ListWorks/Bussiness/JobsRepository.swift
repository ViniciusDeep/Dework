//
//  JobsRepository.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import RxSwift

class JobsRepository {
    func getJobs(completion: @escaping ([Job]) -> Void){
        Service<[Job]>().get(url: Routes.iOS) { (result) in
            switch result {
            case .failure(_):
                break
            case .success(let job):
                completion(job)
            }
        }
    }
}

