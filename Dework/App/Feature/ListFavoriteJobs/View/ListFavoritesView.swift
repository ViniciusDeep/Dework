//
//  ListFavoritesView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Reusable

class ListFavoritesView: UIView, ConfigurableUI, Reusable {
    var customView: UIView?
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(cellType: ListFavoritesCell.self)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([collectionView])
    }
    
    func setupConstraints() {
        collectionView.cBuild(make: .fillSuperview)
    }
}





