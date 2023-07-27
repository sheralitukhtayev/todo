//
//  TaskDetailViewController.swift
//  todo
//
//  Created by ithink on 27/06/23.
//

import UIKit
import SwiftUI

class TaskDetailViewController: UIHostingController<TaskDetailView> {
    private let viewModel: TaskDetailViewModel

    init(viewModel: TaskDetailViewModel) {
        self.viewModel = viewModel
        viewModel.isCompleted = viewModel.selectedTaskItem?.isCompeleted ?? true
        viewModel.isStared = viewModel.selectedTaskItem?.isStared ?? true
        viewModel.taskText = viewModel.selectedTaskItem?.name ?? ""
        viewModel.noteText = self.viewModel.selectedTaskItem?.note ?? ""

        super.init(rootView: TaskDetailView(viewModel: viewModel))
        viewModel.dismissTaskView = { [weak self] item in
            guard let item else {return}
            self?.deleteTaskItem(item: item)
        }
        viewModel.openNoteSheet = { [weak self] task in
            self?.openNoteSheet()
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtn))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        viewModel.noteText = self.viewModel.selectedTaskItem?.note ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func doneBtn() {
        viewModel.editTask(text: viewModel.taskText, isCompleted: viewModel.isCompleted, isStared: viewModel.isStared, taskItem: viewModel.selectedTaskItem!, note: viewModel.noteText)
        dismissView()
    }

    func deleteTaskItem(item: TaskModel) {
        let alertController = UIAlertController(title: "\"\(item.name ?? "")\" will be permanently deleted", message: nil, preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Delete Task", style: .destructive) { (_) in
            self.viewModel.deleteTask(item)
            self.dismissView()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })

        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }

    func dismissView() {
        navigationController?.popViewController(animated: true)
    }

    func openNoteSheet() {
        let setting = TaskNoteViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(setting, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
