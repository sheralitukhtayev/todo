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

    func changeTask(id: String, text: String, isCompleted: Bool, isStared: Bool) throws {
        let fetchRequest = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//        do {
//            let taskMO = try managedObjectContext.fetch(fetchRequest)
//            guard let firstItem = taskMO.first else { throw CoreDataError.notFound }
//            firstItem.name = text
//            firstItem.isStared = isStared
//            firstItem.isCompleted = isCompleted
//            guard managedObjectContext.hasChanges else {return}
//            try managedObjectContext.save()
//        } catch {
//            print("Error editing item: \(error)")
//        }
        do {
            let fetchRequest : NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", id)
            let fetchedResults = try managedObjectContext.fetch(fetchRequest)
            if let changedTask = fetchedResults.first {
                changedTask.isStared = isStared
                changedTask.isCompleted = isCompleted
            }
            guard managedObjectContext.hasChanges else { return }
            try managedObjectContext.save()
        }
        catch {
            print ("fetch task failed", error)
        }
    }
}
