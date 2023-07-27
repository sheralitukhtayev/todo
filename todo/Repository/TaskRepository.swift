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
    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel, taskNote: String) throws
    func reorderTask(from: IndexSet, to: Int) throws
}

final class TaskRepositoryFake: TaskRepositoryProtocol {
    func reorderTask(from: IndexSet, to: Int) throws {

    }

    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel, taskNote: String) throws {

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
    func reorderTask(from: IndexSet, to: Int) throws {
        try reorderTaskService.reorderTask(source: from, destination: to)
    }

    func changeTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel, taskNote: String) throws {
        try changeTaskService.changeTask(text: text, isCompleted: isCompleted, isStared: isStared, taskItem: taskItem, taskNote: taskNote)
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
    private let reorderTaskService: ReorderTaskService

    init(createTaskService: CreateTaskService, fetchTaskService: FetchTaskService, deleteTaskService: DeleteTaskService, changeTaskService: ChangeTaskService, reorderTaskService: ReorderTaskService) {
        self.createTaskService = createTaskService
        self.fetchTaskService = fetchTaskService
        self.deleteTaskService = deleteTaskService
        self.changeTaskService = changeTaskService
        self.reorderTaskService = reorderTaskService
    }

//    func changeListTheme(id: String, text: String) throws {
//        try changeListItemService.changeName(id: id, text: text)
//    }

    func save(model: TaskModel) throws {
        try createTaskService.save(model: model)
    }
}
