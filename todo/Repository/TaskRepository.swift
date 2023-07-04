//
//  TaskRepository.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import Foundation

protocol TaskRepositoryProtocol {
    func save(model: TaskModel) throws
    func fetchTaskItems() throws ->  [TaskModel]
    func deleteTask(model: TaskModel) throws
    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel) throws
}

final class TaskRepositoryFake: TaskRepositoryProtocol {
    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel) throws {

    }

    func deleteTask(model: TaskModel) throws {
        
    }

    func save(model: TaskModel) throws {

    }

    func fetchTaskItems() throws -> [TaskModel] {
        return []
    }

//    func changeListTheme(id: String, text: String) throws {
//
//    }
//
//    func save(model: ListItemModel) throws {
//
//    }
//
//    func fetchListItems() throws -> [ListItemModel] {
//        return []
//    }
//
//    func deleteListItem(model: ListItemModel) throws {
//
//    }
//
//    func save(model: ListItemModelProtocol) throws {}
//    func fetchListItems() throws ->  [ListItemModelProtocol] { return [] }
//    func deleteListItem(model: ListItemModelProtocol) throws { }
}

final class TaskRepository: TaskRepositoryProtocol {
    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel) throws {
        try changeTaskService.changeTask(text: text, isCompleted: isCompleted, isStared: isStared, taskItem: taskItem)
    }

    func deleteTask(model: TaskModel) throws {
        try deleteTaskService.delete(model: model)
    }


    func fetchTaskItems() throws -> [TaskModel] {
        try fetchTaskService.fetchTask()
    }

    private let createTaskService: CreateTaskService
    private let fetchTaskService: FetchTaskService
    private let deleteTaskService: DeleteTaskService
    private let changeTaskService: ChangeTaskService

    init(createTaskService: CreateTaskService, fetchTaskService: FetchTaskService, deleteTaskService: DeleteTaskService, changeTaskService: ChangeTaskService) {
        self.createTaskService = createTaskService
        self.fetchTaskService = fetchTaskService
        self.deleteTaskService = deleteTaskService
        self.changeTaskService = changeTaskService
    }

//    func changeListTheme(id: String, text: String) throws {
//        try changeListItemService.changeName(id: id, text: text)
//    }

    func save(model: TaskModel) throws {
        try createTaskService.save(model: model)
    }
}
