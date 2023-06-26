//
//  DeleteListItemService.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import CoreData


enum CoreDataError: Error {
    case notFound
    case notEnoughData
}

struct DeleteListItemService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func delete(model: ListItemModel) throws {
        guard let modelId = model.id else { throw CoreDataError.notEnoughData }
        let fetchRequest = ListMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", modelId)
        do {
            let listMO = try managedObjectContext.fetch(fetchRequest)
            guard let firstItem = listMO.first else { throw CoreDataError.notFound }
            managedObjectContext.delete(firstItem)
            try managedObjectContext.save()
        } catch {
            print("Error deleting item: \(error)")
        }
    }
}
