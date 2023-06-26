//
//  HomeView.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import SwiftUI
import Components

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var enableDelete = true
    @State private var showDeleteAction = false
    @State var isPresentingEditView = false
    var body: some View {
        VStack {
            List {
                Button(action: {

                }, label: {
                    HomeListItemView(leadingImageSystemName: "squareshape.squareshape.dashed", title: "Title", secondaryImage: false, trailingImageSystemName: "10")
                })
                .listRowSeparator(.hidden)
                ForEach(viewModel.listItems) { item in
                    if let name = item.name {
                        Button(action: {
                            viewModel.navigateListView(item: item)
                        }, label: {
                            HomeListItemView(leadingImageSystemName: "squareshape.squareshape.dashed", title: "\(name)", secondaryImage: false, trailingImageSystemName: "0")
                        })
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                viewModel.editListItemText(id: item.id)
                            } label: {
                                Text("Edit")
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                viewModel.deleteList(item: item)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                    }
                }
                .onMove { from, to in
                    viewModel.moveListPlace(fromOffsets: from, toOffset: to)
                }
            }
            .toolbar {
                EditButton()
            }
            Button {
                viewModel.addListItem()
            } label: {
                Text("New List")
                    .frame(width: 360.0, height: 36.0, alignment: .topLeading)
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarItems(
            leading:
                UserImage(),
            trailing:
                SearchIcon()
        )
        .background(Palette.current.accentColor.suiColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(listItemRepository: ListItemRepositoryFake()))
    }
}
