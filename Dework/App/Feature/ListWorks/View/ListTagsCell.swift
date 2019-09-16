//
//  ListTagsCell.swift
//  Dework
//
//  Created by Vinicius Mangueira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Reusable

class ListTagsCell: UICollectionViewCell, ConfigurableUI, Reusable {
    var customView: UIView? = nil
    
    let boxView: UIView = {
       let view = UIView()
       view.backgroundColor = .yellow
       view.layer.cornerRadius = 4
       return view
    }()
    
    let tagStack: UILabel = {
        let label = UILabel()
        label.text = "Swift"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .primaryColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.5
    }
    
    func buildViewHierarchy() {
       addSubviews([boxView])
       boxView.addSubview(tagStack)
    }
    
    func setupConstraints() {
        boxView.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 5)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
        tagStack.cBuild(make: .centerInSuperView)
    }
    
    func setup(withViewModel viewModel: ListTagCellViewModel) {
        tagStack.text = viewModel.dogTag?.name

        boxView.backgroundColor = UIColor(named: "white")
    }
    
}
