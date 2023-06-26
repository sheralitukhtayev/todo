//
//  ListItemRepository.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import Foundation

protocol ListItemRepositoryProtocol {
    func save(model: ListItemModel) throws
    func fetchListItems() throws ->  [ListItemModel]
    func deleteListItem(model: ListItemModel) throws
    func changeListTheme(id: String, text: String) throws
}

final class ListItemRepositoryFake: ListItemRepositoryProtocol {
    func changeListTheme(id: String, text: String) throws {

    }

    func save(model: ListItemModel) throws {

    }

    func fetchListItems() throws -> [ListItemModel] {
        return []
    }

    func deleteListItem(model: ListItemModel) throws {

    }

    func save(model: ListItemModelProtocol) throws {}
    func fetchListItems() throws ->  [ListItemModelProtocol] { return [] }
    func deleteListItem(model: ListItemModelProtocol) throws { }
}

final class ListItemRepository: ListItemRepositoryProtocol {

    func fetchListItems() throws -> [ListItemModel] {
        try fetchListItemsService.fetchListItems()
    }

    private let createListItemService: CreateListItemService
    private let fetchListItemsService: FetchListItemsService
    private let deleteListItemService: DeleteListItemService
    private let changeListItemService: ChangeListItemService

    init(
        createListItemService: CreateListItemService,
        fetchListItemsService: FetchListItemsService,
        deleteListItemService: DeleteListItemService,
        changeListItemService: ChangeListItemService
    ) {
        self.createListItemService = createListItemService
        self.fetchListItemsService = fetchListItemsService
        self.deleteListItemService = deleteListItemService
        self.changeListItemService =
        changeListItemService
    }

    func changeListTheme(id: String, text: String) throws {
        try changeListItemService.changeName(id: id, text: text)
    }

    func save(model: ListItemModel) throws {
        try createListItemService.save(model: model)
    }

    func deleteListItem(model: ListItemModel) throws {
        try deleteListItemService.delete(model: model)
    }
}
