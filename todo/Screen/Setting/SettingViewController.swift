//
//  SettingViewController.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import UIKit
import SwiftUI

final class SettingViewController: UIHostingController<SettingView> {
    private let viewModel : SettingViewModel

    init(viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init(rootView: SettingView(viewModel: viewModel))
        viewModel.dismiss = { [weak self] in
            self?.dismissView()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func dismissView() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
