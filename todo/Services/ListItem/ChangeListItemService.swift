//
//  ChangeListItemService.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import CoreData

struct ChangeListItemService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func changeName(id: String, text: String) throws {
        let fetchRequest = ListMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            let listMO = try managedObjectContext.fetch(fetchRequest)
            guard let firstItem = listMO.first else { throw CoreDataError.notFound }
            firstItem.name = text
            guard managedObjectContext.hasChanges else {return}
            try managedObjectContext.save()
        } catch {
            print("Error editing item: \(error)")
        }
    }
}
