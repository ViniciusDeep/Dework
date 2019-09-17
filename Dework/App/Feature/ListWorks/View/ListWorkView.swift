//
//  ListWorkView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ListWorkViewDelegate: class {
    func didSelectItem(atDogTag dogTag: DogTag)
}

class ListWorkView: UIView, ConfigurableUI {
    var customView: UIView?
    
    let listTagsViewModel = ListTagsViewModel()
    
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
        return collectionView
    }()
    
    weak var delegate: ListWorkViewDelegate?
    
    
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
           // layout.estimatedItemSize = CGSize(width: 100, height: 100)
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
        return listTagsViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ListTagsCell.self)
        let cellVM = listTagsViewModel.cellViewModel(forIndex: indexPath.row)
        cell.setup(withViewModel: cellVM)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectItem(atDogTag: listTagsViewModel.getStack(atIndex: indexPath.row))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 50)
    }
}

extension ListWorkView {
    func didSelectItem(atDogTag dogTag: DogTag) {
        delegate?.didSelectItem(atDogTag: dogTag)
    }
}
