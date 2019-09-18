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
        setupNavigation()
        self.view.backgroundColor = .foregroundColor
    }
    
    fileprivate func setupNavigation() {
        navigationController?.navigationBar.tintColor = .backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        let starButton = UIBarButtonItem(image: UIImage(named: "unstar"), style: .done, target: self, action: #selector(saveJob))
        navigationItem.rightBarButtonItem = starButton
    }
    
    fileprivate func bindViewModel() {
        (customView as? InsideJobView)?.insideJobViewModel = self.insideJobViewModel
    }
    
    @objc fileprivate func saveJob() {
        navigationItem.rightBarButtonItems?.forEach({ (button) in
            button.image = UIImage(named: "star")
        })
        insideJobViewModel.saveJobToPersistence()
    }
    
}
