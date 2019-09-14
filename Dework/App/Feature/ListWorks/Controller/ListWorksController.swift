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
        (customView as? ListWorkView)?.collectionView.delegate = self
        (customView as? ListWorkView)?.collectionView.dataSource = self
        navigationController?.navigationBar.barTintColor = .primaryColor
    }
}

extension ListWorksController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = (customView as? ListWorkView)?.collectionView.dequeueReusableCell(for: indexPath, cellType: ListWorkCell.self) else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 20, height: 150)
    }
}
