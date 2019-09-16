//
//  ListWorkView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListWorkView: UIView, ConfigurableUI {
    var customView: UIView?
    
    lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .primaryColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(cellType: ListTagsCell.self)
        return collectionView
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(cellType: ListWorkCell.self)
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
        addSubviews([tagsCollectionView,collectionView])
    }
    
    func setupConstraints() {
        if let layout = tagsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        tagsCollectionView.cBuild { (make) in
            make.top.equal(to: self.safeAreaLayoutGuide.topAnchor, offsetBy: 0)
            make.leading.equal(to: leadingAnchor)
            make.trailing.equal(to: trailingAnchor)
            make.height == 50
        }
        
        collectionView.cBuild { (make) in
            make.top.equal(to: tagsCollectionView.bottomAnchor, offsetBy: 0)
            make.leading.equal(to: leadingAnchor)
            make.trailing.equal(to: trailingAnchor)
            make.bottom.equal(to: self.safeAreaLayoutGuide.bottomAnchor)
        }
    }
}

extension ListWorkView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ListTagsCell.self)
        return cell
    }
}
