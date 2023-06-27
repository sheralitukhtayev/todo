//
//  TaskMO+CoreDataProperties.swift
//  todo
//
//  Created by ithink on 26/06/23.
//
//

import Foundation
import CoreData


extension TaskMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskMO> {
        return NSFetchRequest<TaskMO>(entityName: "TaskMO")
    }

    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var isStared: Bool
    @NSManaged public var id: String?
    @NSManaged public var list: ListMO?

}

extension TaskMO : Identifiable {

}
