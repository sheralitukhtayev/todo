//
//  CreateListItem.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import CoreData

struct CreateListItemService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func save(model: ListItemModel) throws {
        let managedObject = ListMO(context: managedObjectContext)
        managedObject.name = model.name
        managedObject.backgroundImage = model.backgroundImage
        managedObject.backgroundColor = model.backgroundColor
        managedObject.id = model.id

        guard managedObjectContext.hasChanges else { return }
        try managedObjectContext.save()
    }
}
