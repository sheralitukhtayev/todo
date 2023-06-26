//
//  HomeViewModel.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import UIKit
import Combine
import CoreData

final class HomeViewModel: ObservableObject {
    @Published var showingSheet = false
    @Published var title: String = "Sherali"
    @Published var avatarURL: String = "house"

    @Published var addListText: String = ""

    let coreDataStack = CoreDataStack.shared

    private var cancelables = Set<AnyCancellable>()

    //     MARK: - Repositories
    private let listItemRepository: ListItemRepositoryProtocol

    @Published var listItems: [ListItemModel] = []

    var openUserImage: (() -> Void)?
    var openSearch: (() -> Void)?
    var createAlert: (() -> Void)?
    var navigateMyDay: (() -> Void)?
    var editListItemText: ((String?) -> Void)?
    var deleteListItem: ((ListItemModel?) -> Void)?
    var navigateListView: ((ListItemModel?) -> Void)?

    init(listItemRepository: ListItemRepositoryProtocol) {
        self.listItemRepository = listItemRepository
    }
}

extension HomeViewModel {
    func fetchRequestList() {
        do {
            let fetchedListItems = try listItemRepository.fetchListItems()
            self.listItems = fetchedListItems
        } catch {
            print(error)
        }
    }

    func addList() {
        do {
            let listItem = ListItemModel(id: UUID().uuidString, name: addListText, backgroundColor: "",backgroundImage:"")
            try listItemRepository.save(model: listItem)
            listItems.append(listItem)
        } catch {
            print(error)
        }
    }

    func deleteItem(_ item: ListItemModel) {
        do {
            try listItemRepository.deleteListItem(model: item)
            listItems.removeAll(where: { $0 == item })
        } catch {
            print(error)
        }
    }

    func editListItem(at id: String, text: String) {
        do {
            try listItemRepository.changeListTheme(id: id, text: text)
            guard let index = self.listItems.firstIndex(where: { $0.id == id }) else {return}
            listItems[index].name = text
        } catch {
            print(error)
        }
    }

    func deleteList(item: ListItemModel) {
        self.deleteListItem?(item)
    }

    func openUserImageView() {
        self.openUserImage?()
    }

    func openSearchView() {
        self.openSearch?()
    }

    func addListItem() {
        self.createAlert?()
    }

    func editListItemText(id: String?) {
        self.editListItemText?(id)
    }

    func navigateListView(item: ListItemModel) {
        self.navigateListView?(item)
    }

    func moveListPlace(
        fromOffsets source: IndexSet,
        toOffset destination: Int
    ) {
        do {
            try! coreDataStack.managedContext.save()
        } catch {
            print("\(error)")
        }
    }
}
