//
//  FavoriteJob.swift
//  Dework
//
//  Created by Vinicius Mangueira on 17/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

@objc(FavoriteJob)
public class FavoriteJob: NSManagedObject {
}

extension FavoriteJob {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteJob> {
        return NSFetchRequest<FavoriteJob>(entityName: "FavoriteJob")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var publisher: String?
    @NSManaged public var body: String?
    
}
