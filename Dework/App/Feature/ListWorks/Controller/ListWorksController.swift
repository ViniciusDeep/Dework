//
//  ListWorkController.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import RxCocoa

class ListWorksController: UIViewController, ConfigurableUI {
    var customView: UIView? = ListWorkView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
        setupComponents()
    }
    
    fileprivate func setupComponents() {
        (customView as? ListWorkView)?.tableView.delegate = self
        (customView as? ListWorkView)?.tableView.dataSource = self
    }
}

extension ListWorksController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
