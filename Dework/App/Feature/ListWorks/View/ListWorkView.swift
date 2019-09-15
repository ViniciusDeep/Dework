//
//  ListWorkView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListWorkView: UIView, ConfigurableUI {
    var customView: UIView? = nil
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(cellType: ListWorkCell.self)
        collectionView.allowsSelection = false
        collectionView.layer.cornerRadius = 16
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([collectionView])
    }
    
    func setupConstraints() {
        collectionView.cBuild { (make) in
            make.top.equal(to: self.safeAreaLayoutGuide.topAnchor)
            make.leading.equal(to: leadingAnchor)
            make.trailing.equal(to: trailingAnchor)
            make.bottom.equal(to: self.safeAreaLayoutGuide.bottomAnchor)
        }
    }
}
