//
//  ListDetailView.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import SwiftUI
import Components

struct ListDetailView: View {
    @ObservedObject var viewModel: ListDetailViewModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ListDetailLabelView(title: "\(viewModel.selectedList?.name ?? "Undefined")")
                Spacer()
                ListDetailTextFieldView(text: "")
            }
            .padding(.horizontal)
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(viewModel: ListDetailViewModel(listItemRepository: ListItemRepositoryFake()))
    }
}
