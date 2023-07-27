//
//  TaskDetailViewModel.swift
//  todo
//
//  Created by ithink on 27/06/23.
//

import Foundation

class TaskDetailViewModel: ObservableObject {
    private let taskRepository: TaskRepositoryProtocol

    var dismissTaskView: ((TaskModel?) -> Void)?
    var openNoteSheet: ((TaskModel?) -> Void)?

    var selectedTaskItem: TaskModel?

    @Published var isCompleted: Bool = true
    @Published var isStared: Bool = true

    @Published var taskText: String = ""
    @Published var noteText: String = ""
    
    init(taskRepository: TaskRepositoryProtocol) {
        self.taskRepository = taskRepository
    }
}

extension TaskDetailViewModel {
    func deleteTask(_ item: TaskModel) {
        do {
            try taskRepository.deleteTask(model: item)
            
        } catch {
            print(error)
        }
    }

    func dismissView(_ item: TaskModel) {
        self.dismissTaskView?(item)
    }

    func editTask(text: String, isCompleted: Bool, isStared: Bool, taskItem: TaskModel, note: String) {
        do {
            try taskRepository.changeTask(text: text, isCompleted: isCompleted, isStared: isStared, taskItem: taskItem, taskNote: note)
        } catch {
            print(error)
        }
    }

    func openNote(task: TaskModel) {
        self.openNoteSheet?(task)
    }
}
