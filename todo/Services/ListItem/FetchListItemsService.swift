//
//  FetchListItem.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import CoreData

struct FetchListItemsService {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func fetchListItems() throws -> [ListItemModel] {
        let fetchRequest = NSFetchRequest<ListMO>(entityName: "ListMO")
        let items = try managedObjectContext.fetch(fetchRequest)
        let listItemModels = items.map { ListItemModel(id: $0.id, name: $0.name, backgroundColor: $0.backgroundColor, backgroundImage: $0.backgroundImage) }
        return listItemModels
    }
}
