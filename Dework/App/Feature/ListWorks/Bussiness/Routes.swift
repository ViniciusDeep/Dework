//
//  Routes.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

enum Routes {
    fileprivate static var baseUrl: String {
        return "https://api.github.com/repos/"
    }
}

extension Routes {
    static var iOS: String {
        return "\(baseUrl)CocoaHeadsBrasil/vagas/issues"
    }
    
    static var frontEnd: String {
        return "\(baseUrl)frontendbr/vagas/issues"
    }
    
    static var backEnd: String {
        return "\(baseUrl)backend-br/vagas/issues"
    }
    
    static var react: String {
        return "\(baseUrl)react-brasil/vagas/issues"
    }
    
    static var java: String {
        return "\(baseUrl)soujava/vagas-java/issues"
    }
    
    static var vueJs: String {
        return "\(baseUrl)vuejs-br/vagas/issues"
    }
}
