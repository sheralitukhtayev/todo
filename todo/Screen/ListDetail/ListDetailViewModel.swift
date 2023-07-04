//
//  ListDetailViewModel.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import UIKit
import SwiftUI
import Components

final class ListDetailViewModel: ObservableObject {

    private let taskRepository: TaskRepository

    var selectedList : ListItemModel?

    var navigateToTaskDetail : ((TaskModel?) -> Void)?

    var isCompleted: Bool!
    var isStared: Bool!

    @Published var taskItems: [TaskModel] = []

    @Published var taskText: String = ""

    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
    }
}

extension ListDetailViewModel {
    func addTask() {
        do {
            let taskItem = TaskModel(id: UUID().uuidString, isCompeleted: isCompleted, isStared: isStared, name: taskText, note: nil)
            if !taskText.isEmpty {
                try taskRepository.save(model: taskItem)
                taskItems.append(taskItem)
            }
            taskText = ""
        } catch {
            print(error)
        }
    }

    func fetchRequestTask() {
        do {
            let fetchedTasks = try taskRepository.fetchTaskItems()
            self.taskItems = fetchedTasks
        } catch {
            print(error)
        }
    }

    func deleteTask(_ item: TaskModel) {
        do {
            try taskRepository.deleteTask(model: item)
            taskItems.removeAll(where: { $0 == item })
        } catch {
            print(error)
        }
    }
    
    func editTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel) {
        do {
            try taskRepository.changeTask(text: text, isCompleted: isCompleted, isStared: isStared, taskItem: taskItem)
            guard let index = self.taskItems.firstIndex(where: { $0 == taskItem }) else {return}
            taskItems[index].isStared = isStared
            taskItems[index].isCompeleted = isCompleted
        } catch {
            print(error)
        }
    }

    func navigateToTaskDetailView(item: TaskModel) {
        self.navigateToTaskDetail?(item)
    }

    func sortFetchedTasks() {
        
    }
}
