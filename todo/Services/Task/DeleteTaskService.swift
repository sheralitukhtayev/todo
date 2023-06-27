//
//  DeleteTaskService.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import CoreData

struct DeleteTaskService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func delete(model: TaskModel) throws {
        guard let modelId = model.id else { throw CoreDataError.notEnoughData }
        let fetchRequest = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", modelId)
        do {
            let taskMO = try managedObjectContext.fetch(fetchRequest)
            guard let firstItem = taskMO.first else { throw CoreDataError.notFound }
            managedObjectContext.delete(firstItem)
            try managedObjectContext.save()
        } catch {
            print("Error deleting item: \(error)")
        }
    }
}
