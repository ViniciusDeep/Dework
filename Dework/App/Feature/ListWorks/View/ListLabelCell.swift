//
//  ListLabelCell.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Reusable

class ListLabelCell: UICollectionViewCell, ConfigurableUI, Reusable {
    var customView: UIView?
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(red:0.98, green:0.45, blue:0.36, alpha:1.0)
        return view
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
       label.text = "Pleno"
       label.textColor = .primaryColor
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Does not load cell")
    }
    
    fileprivate func setupLayout() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    func buildViewHierarchy() {
       addSubviews([boxView])
       boxView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        boxView.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 5)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
        titleLabel.cBuild(make: .centerYInSuperView)
        
        titleLabel.cBuild { (make) in
            make.leading.equal(to: leadingAnchor, offsetBy: 15)
            make.trailing.equal(to: trailingAnchor, offsetBy: -15)
        }
    }
}
