//
//  ListWorkCell.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class ListWorkCell: UICollectionViewCell,ConfigurableUI, Reusable {
    var customView: UIView? = nil

    let imageJob: RoundableImage = {
        let roundImage = RoundableImage(frame: .zero)
        roundImage.image = UIImage(named: "jobplaceholder")
        return roundImage
    }()
    
    let nameJob: UILabel = {
       let label = UILabel()
       label.textColor = .white
       label.numberOfLines = 0
       label.lineBreakMode = .byWordWrapping
       return label
    }()
    
    let recruiterJob: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var labelCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: ListLabelCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
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
        self.backgroundColor = .primaryColor
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.5
    }
    
    func buildViewHierarchy() {
        addSubviews([imageJob, nameJob, recruiterJob, labelCollectionView])
    }
    
    func setupConstraints() {
        if let layout = labelCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        imageJob.cBuild { (make) in
            make.top.equal(to: self.topAnchor, offsetBy: 10)
            make.leading.equal(to: self.leadingAnchor, offsetBy: 10)
            make.width.equal(to: 100)
            make.height.equal(to: 100)
        }
        
        nameJob.cBuild { (make) in
            make.top.equal(to: imageJob.topAnchor, offsetBy: 10)
            make.leading.equal(to: imageJob.trailingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
        recruiterJob.cBuild { (make) in
            make.top.equal(to: nameJob.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: nameJob.leadingAnchor)
            make.trailing.equal(to: nameJob.trailingAnchor)
        }
        
        labelCollectionView.cBuild { (make) in
            make.top.equal(to: imageJob.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 5)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
    }
    
    func setup(viewModel: ListWorksCellViewModel) {
        nameJob.text = viewModel.job?.title
        recruiterJob.text = "Recruiter: @\(viewModel.job?.user.username ?? "")"
        guard let imageUrl = viewModel.job?.user.avatarUrl else {return}
        imageJob.sd_setImage(with: URL(string: imageUrl))        
    }
}
