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
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .primaryColor
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .primaryColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.cBuild(make: .fillSuperview)
    }
}
