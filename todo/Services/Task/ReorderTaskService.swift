//
//  ReorderTaskService.swift
//  todo
//
//  Created by ithink on 05/07/23.
//

import CoreData

struct ReorderTaskService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func reorderTask(source: IndexSet, destination: Int) throws {
        let fetchRequest = TaskMO.fetchRequest()
        do {
            var tasks = try! managedObjectContext.fetch(fetchRequest)
            
        } catch {
            print("Error: Reordering")
        }
    }
}
