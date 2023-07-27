//
//  HomeViewController.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import UIKit
import SwiftUI
import CoreData

final class HomeViewController: UIHostingController<HomeView> {
    private let viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(rootView: HomeView(viewModel: viewModel))
        viewModel.openUserImage = { [weak self] in
            self?.openUserImage()
        }
        viewModel.openSearch = { [weak self] in
            self?.openSearch()
        }
        viewModel.createAlert = { [weak self] in
            self?.createAlertController()
        }
        viewModel.editListItemText = { [weak self] id in
            self?.editListItemText(id: id)
        }
        viewModel.deleteListItem = { [weak self] item in
            guard let item else { return }
            self?.deleteListItem(item)
        }
        viewModel.navigateListView = { [weak self] item in
            guard let item else {return}
            self?.navigateListView(item: item)
        }
        viewModel.fetchRequestList()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeViewController {
    func navigateListView(item: ListItemModel) {
        let listDetailView = ListDetailAssembly.makeViewController(selectedListItem: item)
        listDetailView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(listDetailView, animated: true)
    }

    func openUserImage() {
        let settingView = SettingViewController(viewModel: SettingViewModel())
        navigationController?.present(settingView, animated: true, completion: nil)
    }

    func deleteListItem(_ item: ListItemModel) {
        let alertController = UIAlertController(title: "\"\(item.name ?? "")\" will be permanently deleted", message: nil, preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Delete List", style: .destructive) { (_) in
            self.viewModel.deleteItem(item)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })

        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }

    func openSearch() {
//        let vc = SearchViewAssembly.makeViewController()
//        vc.hidesBottomBarWhenPushed = true
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true)
    }

    func createAlertController() {
        let alertController = UIAlertController(title: "Add new Items", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let textFields = alertController.textFields else { return }

            if let listText = textFields[0].text, !listText.isEmpty {
                self.viewModel.addListText = listText
                self.viewModel.addList()
            }
        }

        alertController.addTextField { (textField) in

        }
        alertController.addAction(addAction)
        self.present(alertController, animated: true)
    }

    func editListItemText(id: String?) {
        guard let id else { return }
        let alertController = UIAlertController(title: "Edit List", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Done", style: .default) { (_) in
            guard let textFields = alertController.textFields else { return }

            if let editText = textFields[0].text, !editText.isEmpty {
                self.editActionSheetMenu(text: editText, id: id)
            }
        }

        alertController.addTextField { (textField) in

        }
        alertController.addAction(addAction)
        self.present(alertController, animated: true)
    }

    func editActionSheetMenu(text: String, id: String) {
        guard let index = self.viewModel.listItems.firstIndex(where: { $0.id == id }) else {return}
        let optionMenu = UIAlertController(title: nil, message: "\"\(viewModel.listItems[index].name ?? "")\" will be permanently edited", preferredStyle: .actionSheet)

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.viewModel.editListItem(at: id, text: text)
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}
