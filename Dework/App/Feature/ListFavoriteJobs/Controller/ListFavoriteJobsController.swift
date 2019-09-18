//
//  ListFavoriteJobsView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import RxCocoa

class ListFavoriteController: UIViewController, ConfigurableUI {
    var customView: UIView? = ListFavoritesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupComponents()
    }
    
    fileprivate func setupComponents() {
        (customView as? ListFavoritesView)?.tableView.delegate = self
        (customView as? ListFavoritesView)?.tableView.dataSource = self
    }
}

extension ListFavoriteController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ListFavoritesCell.self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(InsideJobController(), animated: true)
    }
}
