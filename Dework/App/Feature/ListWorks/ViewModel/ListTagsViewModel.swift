//
//  ListTagsViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class ListTagsViewModel {
    let dogTags = [DogTag(colorNamed: "Red", stack: .iOS, route: Routes.iOS), DogTag(colorNamed: "Red", stack: .BackEnd, route: Routes.backEnd),DogTag(colorNamed: "Red", stack: .FrontEnd, route: Routes.frontEnd),DogTag(colorNamed: "Red", stack: .React, route: Routes.react),DogTag(colorNamed: "Red", stack: .Java, route: Routes.java),DogTag(colorNamed: "Red", stack: .VueJS, route: Routes.vueJs),]
    
    func numberOfRows() -> Int {
        return dogTags.count
    }
    
    func cellViewModel(forIndex index: Int) -> ListTagCellViewModel {
        return ListTagCellViewModel(dogTags[index])
    }
}
