//
//  ListDetailAssembly.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import Foundation
import UIKit

final class ListDetailAssembly {
    static func makeViewController(selectedListItem: ListItemModel) -> UIViewController {

        let coreDataStack = CoreDataStack.shared
        let createListService = CreateListItemService(managedObjectContext: coreDataStack.managedContext)
        let fetchListItemsService = FetchListItemsService(managedObjectContext: coreDataStack.managedContext)
        let deleteListItemService = DeleteListItemService(managedObjectContext: coreDataStack.managedContext)
        let changeListItemService = ChangeListItemService(managedObjectContext: coreDataStack.managedContext)

        let createTaskService = CreateTaskService(managedObjectContext: coreDataStack.managedContext)
        let fetchTaskService = FetchTaskService(managedObjectContext: coreDataStack.managedContext)
        let deleteTaskService = DeleteTaskService(managedObjectContext: coreDataStack.managedContext)
        let changeTaskService = ChangeTaskService(managedObjectContext: coreDataStack.managedContext)

        let listItemRepository = ListItemRepository(createListItemService: createListService, fetchListItemsService: fetchListItemsService, deleteListItemService: deleteListItemService, changeListItemService: changeListItemService)

        let taskRepository = TaskRepository(createTaskService: createTaskService, fetchTaskService: fetchTaskService, deleteTaskService: deleteTaskService, changeTaskService: changeTaskService)

        let viewModel = ListDetailViewModel(taskRepository: taskRepository)

        viewModel.selectedList = selectedListItem

        let viewController = ListDetailViewController(viewModel: viewModel)
        return viewController
    }
}
