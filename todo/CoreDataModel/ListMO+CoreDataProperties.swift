//
//  ListMO+CoreDataProperties.swift
//  TODO-APP
//
//  Created by ithink on 26/06/23.
//
//

import Foundation
import CoreData


extension ListMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListMO> {
        return NSFetchRequest<ListMO>(entityName: "ListMO")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var backgroundColor: String?
    @NSManaged public var backgroundImage: String?

}

extension ListMO : Identifiable {

}
