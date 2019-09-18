//
//  ListFavoritesView.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import Reusable

class ListFavoritesView: UIView, ConfigurableUI, Reusable {
    var customView: UIView?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .backgroundColor
        tableView.register(cellType: ListFavoritesCell.self)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
//        tableView.allowsSelection = false
        
        return tableView
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
        addSubviews([tableView])
    }
    
    func setupConstraints() {
        tableView.cBuild(make: .fillSuperview)
    }
}





