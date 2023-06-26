//
//  ListDetailViewModel.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import UIKit
import SwiftUI

final class ListDetailViewModel: ObservableObject {

    private let listItemRepository: ListItemRepositoryProtocol

    var selectedList : ListItemModel?

    init(listItemRepository: ListItemRepositoryProtocol) {
        self.listItemRepository = listItemRepository
    }
}
