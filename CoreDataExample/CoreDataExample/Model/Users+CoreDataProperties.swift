//
//  Users+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by nguyen gia huy on 22/10/2020.
//
//

import Foundation
import CoreData
import UIKit

extension Users {

    @nonobjc public class func fetchRequestUsers() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }
//    @nonobjc public class func updateUser(name: String) {
//        let request = NSBatchUpdateRequest(entityName: "Users")
//        let predicate = NSPredicate(format: "name == \(name)")
//        request.predicate = predicate
//            request.propertiesToUpdate = ["name":name]
//        request.resultType = .updatedObjectIDsResultType
//          
//            do {
//
//                let result = try context.execute(request) as! NSBatchUpdateResult
//            }catch {
//            }
//    }
    @NSManaged public var name: String?
    @NSManaged public var creditCard: NSSet?

}

// MARK: Generated accessors for creditCard
extension Users {

    @objc(addCreditCardObject:)
    @NSManaged public func addToCreditCard(_ value: Credits)

    @objc(removeCreditCardObject:)
    @NSManaged public func removeFromCreditCard(_ value: Credits)

    @objc(addCreditCard:)
    @NSManaged public func addToCreditCard(_ values: NSSet)

    @objc(removeCreditCard:)
    @NSManaged public func removeFromCreditCard(_ values: NSSet)

}

extension Users : Identifiable {

}
