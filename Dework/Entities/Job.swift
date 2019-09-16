//
//  Job.swift
//  Dework
//
//  Created by Vinicius Mangueira on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Job: Decodable {
    let url: String?
    let title: String?
    let body: String?
    let user: User
}

struct User: Decodable {
    let avatarUrl: String?
    let username: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case username = "login"
    }
}
