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
        super.init(rootView: TaskDetailView(viewModel: viewModel))
        viewModel.dismissTaskView = { [weak self] item in
            guard let item else {return}
            self?.dismissView(item: item)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func dismissView(item: TaskModel) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
