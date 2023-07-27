//
//  TaskNoteViewController.swift
//  todo
//
//  Created by ithink on 04/07/23.
//

import UIKit
import SwiftUI

class TaskNoteViewController: UIHostingController<TaskNoteView> {

    let viewModel: TaskDetailViewModel

    init(viewModel: TaskDetailViewModel) {
        self.viewModel = viewModel
//        self.viewModel.noteText = viewModel.selectedTaskItem?.note ?? ""
        super.init(rootView: TaskNoteView(viewModel: viewModel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(changeTaskNote))
    }

    @objc func changeTaskNote() {
        viewModel.editTask(text: viewModel.taskText, isCompleted: viewModel.isCompleted, isStared: viewModel.isStared, taskItem: viewModel.selectedTaskItem!, note: viewModel.noteText)
        self.navigationController?.popViewController(animated: true)
    }


    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
