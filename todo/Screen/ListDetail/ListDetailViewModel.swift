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

    var isCompleted: Bool = true
    var isStared: Bool = true

    @Published var taskItems: [TaskModel] = []

    @Published var taskText: String = ""

    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
    }
}

extension ListDetailViewModel {
    func addTask() {
        do {
            let taskItem = TaskModel(id: UUID().uuidString, isCompeleted: isCompleted, isStared: isCompleted, name: taskText, note: nil)
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
    
    func editTask(at id: String, text: String, isCompleted: Bool, isStared: Bool) {
        do {
            try taskRepository.changeTask(id: id, text: text, isCompleted: self.isCompleted, isStared: self.isStared)
            guard let index = self.taskItems.firstIndex(where: { $0.id == id }) else {return}
            taskItems[index].isStared = isStared
            taskItems[index].isCompeleted = isCompleted
        } catch {
            print(error)
        }
    }
}
