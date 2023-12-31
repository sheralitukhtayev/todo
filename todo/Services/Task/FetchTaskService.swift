//
//  FetchTaskService.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import CoreData

struct FetchTaskService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func fetchTask() throws -> [TaskModel] {
        let fetchRequest = NSFetchRequest<TaskMO>(entityName: "TaskMO")
        let orderSort = NSSortDescriptor(key: "order", ascending: true)
        fetchRequest.sortDescriptors = [orderSort]
        let items = try managedObjectContext.fetch(fetchRequest)
        let taskModels = items.map { TaskModel(order: $0.order, id: $0.id, isCompeleted: $0.isCompleted, isStared: $0.isStared, name: $0.name, note: $0.note) }
        return taskModels
    }
}
