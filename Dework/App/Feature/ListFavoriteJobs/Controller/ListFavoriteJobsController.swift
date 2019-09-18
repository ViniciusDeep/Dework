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
                 (self.customView as? ListFavoritesView)?.collectionView.reloadData()
            }
        }
    }
    
    fileprivate func setupComponents() {
        (customView as? ListFavoritesView)?.collectionView.delegate = self
        (customView as? ListFavoritesView)?.collectionView.dataSource = self
    }
}

extension ListFavoriteController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listFavoriteViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ListFavoritesCell.self)
        let cellVM = listFavoriteViewModel.cellViewModel(atIndex: indexPath.row)
        cell.setup(withViewModel: cellVM)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(InsideJobController(listFavoriteViewModel.didPerformFavoriteToJob(atIndex: indexPath)), animated: true)
    }
}
