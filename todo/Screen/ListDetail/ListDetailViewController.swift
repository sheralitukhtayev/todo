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
}
