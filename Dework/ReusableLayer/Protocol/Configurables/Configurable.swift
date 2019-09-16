//
//  Configurable.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableUI {
    var customView: UIView? { get set }
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ConfigurableUI where Self : UIViewController {
    
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
    func buildViewHierarchy() {
        guard let myView = customView else {return print("You should pass view")}
        self.view.addSubview(myView)
    }
    func setupConstraints() {
        if let myView = customView {
            myView.cBuild(make: .fillSuperview)
        }
    }
}

extension ConfigurableUI where Self: UIView {
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
}

