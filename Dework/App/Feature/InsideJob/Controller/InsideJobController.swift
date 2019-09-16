//
//  InsideJobController.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideJobController: UIViewController, ConfigurableUI {
    var customView: UIView? = InsideJobView()
    
    var insideJobViewModel = InsideJobViewModel(job: Job(url: "", title: "", body: "### Swift", user: User(avatarUrl: "", username: "")))
    
    convenience init(_ job: Job) {
        self.init()
        insideJobViewModel = InsideJobViewModel(job: job)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        self.view.backgroundColor = .foregroundColor
        navigationController?.navigationBar.tintColor = .backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    fileprivate func bindViewModel() {
        (customView as? InsideJobView)?.insideJobViewModel = self.insideJobViewModel
    }
    
}
