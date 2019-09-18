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
    let listFavoriteViewModel = ListFavoriteViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        setupComponents()
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        listFavoriteViewModel.updateList = {
            DispatchQueue.main.async {
                 (self.customView as? ListFavoritesView)?.tableView.reloadData()
            }
        }
    }
    
    fileprivate func setupComponents() {
        (customView as? ListFavoritesView)?.tableView.delegate = self
        (customView as? ListFavoritesView)?.tableView.dataSource = self
    }
}

extension ListFavoriteController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFavoriteViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ListFavoritesCell.self)
        let cellVM = listFavoriteViewModel.cellViewModel(atIndex: indexPath.row)
        cell.setup(withViewModel: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(InsideJobController(listFavoriteViewModel.didPerformFavoriteToJob(atIndex: indexPath)), animated: true)
    }
}
