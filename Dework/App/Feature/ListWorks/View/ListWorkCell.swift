//
//  ListWorkCell.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Reusable

class ListWorkCell: UICollectionViewCell,ConfigurableUI, Reusable {
    var customView: UIView? = nil

    let imageJob: RoundableImage = {
        let roundImage = RoundableImage(frame: .zero)
        roundImage.image = UIImage(named: "jobplaceholder")
        return roundImage
    }()
    
    let nameJob: UILabel = {
       let label = UILabel()
       label.text = "Instituto Antlântico"
       label.textColor = .white
       return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .primaryColor
        self.layer.cornerRadius = 16
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageJob, nameJob])
    }
    
    func setupConstraints() {
        imageJob.cBuild { (make) in
            make.top.equal(to: self.topAnchor, offsetBy: 10)
            make.leading.equal(to: self.leadingAnchor, offsetBy: 10)
            make.width.equal(to: 100)
            make.height.equal(to: 100)
        }
        
        nameJob.cBuild { (make) in
            make.top.equal(to: imageJob.topAnchor, offsetBy: 10)
            make.leading.equal(to: imageJob.trailingAnchor, offsetBy: 10)
        }
        
        
        
    }
}
