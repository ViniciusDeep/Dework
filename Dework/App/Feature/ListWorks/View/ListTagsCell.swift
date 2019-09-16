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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
       addSubviews([boxView])
    }
    
    func setupConstraints() {
        boxView.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 5)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
    }
}
