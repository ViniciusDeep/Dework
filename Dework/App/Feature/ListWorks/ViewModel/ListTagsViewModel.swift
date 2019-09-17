//
//  ListTagsViewModel.swift
//  Dework
//
//  Created by Vinicius Mangueira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class ListTagsViewModel {
    fileprivate let dogTags = [DogTag(colorNamed: "White", stack: .iOS, route: Routes.iOS), DogTag(colorNamed: "White", stack: .BackEnd, route: Routes.backEnd),DogTag(colorNamed: "White", stack: .FrontEnd, route: Routes.frontEnd),DogTag(colorNamed: "White", stack: .React, route: Routes.react),DogTag(colorNamed: "White", stack: .Java, route: Routes.java),DogTag(colorNamed: "White", stack: .VueJS, route: Routes.vueJs),]
    
    func numberOfRows() -> Int {
        return dogTags.count
    }
    
    func cellViewModel(forIndex index: Int) -> ListTagCellViewModel {
        return ListTagCellViewModel(dogTags[index])
    }
    
    func getStack(atIndex index: Int) -> DogTag {
        let stack = dogTags[index]
        return stack
    }
}
