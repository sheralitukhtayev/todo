//
//  ListDetailViewController.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import UIKit
import SwiftUI

class ListDetailViewController: UIHostingController<ListDetailView> {
    private let viewModel: ListDetailViewModel

    init(viewModel: ListDetailViewModel) {
        self.viewModel = viewModel
        super.init(rootView: ListDetailView(viewModel: viewModel))

        viewModel.navigateToTaskDetail = { [weak self] item in
            guard let item else {return}
            self?.navigateToTaskDetailView(item)
        }
        viewModel.editTaskName = { [weak self] item in
            guard let item else {return}
            self?.editTaskName(item: item)
        }

        viewModel.deleteTask = { [weak self] item in
            guard let item else {return}
            self?.deleteTaskItem(item: item)
        }

        let person = UIBarButtonItem(image: UIImage(systemName: "person.badge.plus"), style: .done, target: self, action: nil)
        let settings = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(openListOption))

        navigationItem.rightBarButtonItems = [person, settings]
        navigationItem.rightBarButtonItem?.tintColor = .systemBlue
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel.fetchRequestTask()
    }



    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func doneBtn() {
        dismiss(animated: true)
    }

    @objc func openListOption() {
        let navigationController = UINavigationController(rootViewController: ListOptionViewController(viewModel: ListOptionViewModel()))

        navigationController.modalPresentationStyle = .pageSheet

        if let sheet = navigationController.sheetPresentationController {

            sheet.detents = [.medium()]

        }
        present(navigationController, animated: true, completion: nil)
    }

    func navigateToTaskDetailView(_ item: TaskModel) {
        let detailView = TaskDetailAssembly.makeVeiwController(selectedItem: item)
        navigationController?.pushViewController(detailView, animated: true)
    }

    func editTaskName(item: TaskModel?) {
        guard let item else {return}
        let alertController = UIAlertController(title: "Edit Task Name", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Done", style: .default) { (_) in
            guard let textFields = alertController.textFields else { return }

            if let editText = textFields[0].text, !editText.isEmpty {
                self.editActionSheetMenu(text: editText, item: item)
            }
        }

        alertController.addTextField { (textField) in

        }
        alertController.addAction(addAction)
        self.present(alertController, animated: true)
    }

    func editActionSheetMenu(text: String, item: TaskModel) {
        let optionMenu = UIAlertController(title: nil, message: "\"\(item.name ?? "")\" will be permanently edited", preferredStyle: .actionSheet)

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.viewModel.editTask(text: text, isCompleted: item.isCompeleted ?? false, isStared: item.isStared ?? false, taskItem: item, note: "")
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }

    func deleteTaskItem(item: TaskModel) {
        let alertController = UIAlertController(title: "\"\(item.name ?? "")\" will be permanently deleted", message: nil, preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Delete Task", style: .destructive) { (_) in
            self.viewModel.deleteTask(item)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })

        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
}
