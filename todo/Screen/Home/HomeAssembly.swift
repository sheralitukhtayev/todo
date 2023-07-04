//
//  HomeAssembly.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import UIKit
import CoreData

final class HomeAssembly {
    static func makeViewController() -> UIViewController {

        let coreDataStack = CoreDataStack.shared
        let createListService = CreateListItemService(managedObjectContext: coreDataStack.managedContext)
        let fetchListItemsService = FetchListItemsService(managedObjectContext: coreDataStack.managedContext)
        let deleteListItemService = DeleteListItemService(managedObjectContext: coreDataStack.managedContext)
        let changeListItemService = ChangeListItemService(managedObjectContext: coreDataStack.managedContext)

        let listItemRepository = ListItemRepository(
            createListItemService: createListService,
            fetchListItemsService: fetchListItemsService,
            deleteListItemService: deleteListItemService,
            changeListItemService: changeListItemService
        )

        let viewModel = HomeViewModel(listItemRepository: listItemRepository)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
