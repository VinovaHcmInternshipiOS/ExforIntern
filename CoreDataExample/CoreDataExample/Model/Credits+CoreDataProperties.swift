//
//  Credits+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by nguyen gia huy on 22/10/2020.
//
//

import Foundation
import CoreData
import UIKit

extension Credits {

    @nonobjc public class func fetchRequestCredits() -> NSFetchRequest<Credits> {
        return NSFetchRequest<Credits>(entityName: "Credits")
    }
    @nonobjc public class func fetchRequestCreditsByKey(key: Users) -> NSFetchRequest<Credits> {
        let userFetchRequest = NSFetchRequest<Credits>(entityName: "Credits")
        userFetchRequest.predicate = NSPredicate(format: "name == %@",key)
        
        return userFetchRequest
    }
    @NSManaged public var number: String?
    @NSManaged public var name: Users?

}

extension Credits : Identifiable {

}
