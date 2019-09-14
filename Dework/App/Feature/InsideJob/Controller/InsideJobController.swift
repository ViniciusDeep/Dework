//
//  InsideJobController.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InsideJobController: UIViewController, ConfigurableUI {
    var customView: UIView? = InsideJobView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
}
