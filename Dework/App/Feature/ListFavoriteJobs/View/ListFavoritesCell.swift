//
//  ListFavoritesCell.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Reusable

class ListFavoritesCell: UICollectionViewCell, Reusable, ConfigurableUI {
    var customView: UIView?
    
    let jobTitle: UILabel = {
      let label = UILabel()
      label.text = "[Florianópolis] Front-end Developer na Cheesecake Labs"
      label.textColor = .backgroundColor
      label.lineBreakMode = .byWordWrapping
      label.numberOfLines = 0
      return label
    }()
    
    let jobRecruiter: UILabel = {
        let label = UILabel()
        label.text = "Recruiter: @cheesecakelabs-challenges"
        label.textColor = .backgroundColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
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
        self.backgroundColor = .primaryColor
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.5
    }

    func buildViewHierarchy() {
        addSubviews([jobTitle, jobRecruiter])
    }
    
    func setupConstraints() {
        jobTitle.cBuild { (make) in
            make.top.equal(to: topAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
        
        jobRecruiter.cBuild { (make) in
            make.top.equal(to: jobTitle.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: jobTitle.leadingAnchor)
            make.trailing.equal(to: jobTitle.trailingAnchor)
        }
    }
    
    func setup(withViewModel viewModel: ListFavoriteCellViewModel) {
        jobTitle.text = viewModel.favoriteJob?.title
        jobRecruiter.text = "Publisher: @\(viewModel.favoriteJob?.publisher ?? "")"
    }
}
