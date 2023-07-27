//
//  CreateTaskService.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import CoreData

struct CreateTaskService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func save(model: TaskModel) throws {
        let managedObject = TaskMO(context: managedObjectContext)
        managedObject.order = model.order ?? Int16()
        managedObject.id = model.id
        managedObject.name = model.name
        managedObject.note = model.note
        managedObject.isStared = model.isStared ?? false
        managedObject.isCompleted = model.isCompeleted ?? false

        guard managedObjectContext.hasChanges else { return }
        try managedObjectContext.save()
    }
}
