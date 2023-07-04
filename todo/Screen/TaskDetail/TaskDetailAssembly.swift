//
//  TaskDetailAssembly.swift
//  todo
//
//  Created by ithink on 27/06/23.
//

import UIKit

final class TaskDetailAssembly {
    static func makeVeiwController(selectedItem: TaskModel) -> UIViewController {

        let coreDataStack = CoreDataStack.shared

        let createTaskService = CreateTaskService(managedObjectContext: coreDataStack.managedContext)
        let fetchTaskService = FetchTaskService(managedObjectContext: coreDataStack.managedContext)
        let deleteTaskService = DeleteTaskService(managedObjectContext: coreDataStack.managedContext)
        let changeTaskService = ChangeTaskService(managedObjectContext: coreDataStack.managedContext)

        let taskRepository = TaskRepository(createTaskService: createTaskService, fetchTaskService: fetchTaskService, deleteTaskService: deleteTaskService, changeTaskService: changeTaskService)

        let viewModel = TaskDetailViewModel(taskRepository: taskRepository)

        viewModel.selectedTaskItem = selectedItem

        let viewController = TaskDetailViewController(viewModel: viewModel)

        return viewController
    }
}
