//
//  DogTag.swift
//  Dework
//
//  Created by Vinicius Mangueira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct DogTag {
    let name: String
    let colorNamed: String
    let stack: Stack
    let route: String
    
    init(colorNamed: String, stack: Stack, route: String) {
        self.colorNamed = colorNamed
        self.stack = stack
        self.name = "\(stack)"
        self.route = route
    }
}
