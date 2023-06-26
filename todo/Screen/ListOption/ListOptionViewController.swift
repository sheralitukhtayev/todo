//
//  ListOptionViewController.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import UIKit
import SwiftUI

class ListOptionViewController: UIHostingController<ListOptionView>{
    let viewModel: ListOptionViewModel

    init(viewModel: ListOptionViewModel) {
        self.viewModel = viewModel
        super.init(rootView: ListOptionView(viewModel: viewModel))

        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissSheet))
        doneBtn.tintColor = .systemBlue

        navigationItem.rightBarButtonItem = doneBtn
    }

    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func dismissSheet() {
        dismiss(animated: true)
    }
}
