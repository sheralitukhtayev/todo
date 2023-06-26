//
//  ListOptionView.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import SwiftUI
import Components

private enum Constants {
    static let listOptions = "List Options"
}

struct ListOptionView: View {
    let viewModel: ListOptionViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(listOptionArray) { item in
                    item
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(Constants.listOptions)
    }
}

struct ListOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ListOptionView(viewModel: ListOptionViewModel())
    }
}
