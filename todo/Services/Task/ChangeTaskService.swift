//
//  EditTaskService.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import CoreData

struct ChangeTaskService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel, taskNote: String) throws {
        guard let modelId = taskItem.id else { throw CoreDataError.notEnoughData }
        let fetchRequest = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", modelId)
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            if let changedTask = fetchedResults.first {
                changedTask.name = text
                changedTask.isStared = isStared
                changedTask.isCompleted = isCompleted
                changedTask.note = taskNote
            }
            guard managedObjectContext.hasChanges else { return }
            try managedObjectContext.save()
        }
        catch {
            print ("fetch task failed", error)
        }
    }
}
