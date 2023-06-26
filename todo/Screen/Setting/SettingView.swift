//
//  SettingView.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import SwiftUI
import Components

struct SettingView: View {
    @ObservedObject var viewModel: SettingViewModel
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        Toggle("DarkMode on", isOn: $viewModel.isDarkModeOn)
                    } header: {
                        Text("General")
                    }
                    Section {
//                        SettingListItemView(leadingImageSystemName: "character.cursor.ibeam", title: "Rename list", underTitle: nil, cellType: .ordinary, trailingDetailText: nil, toggleIsOn: false)
                        SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "character.cursor.ibeam", title: "Rename List", underTitle: nil, trailingDetailText: nil)
                    } header: {
                        Text("Detail")
                    }
                    Section {
//                        SettingListItemView(leadingImageSystemName: "character.cursor.ibeam", title: "Navigation", underTitle: nil, cellType: .navigation, trailingDetailText: nil, toggleIsOn: false)
                        SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "character.cursor.ibeam", title: "Rename List", underTitle: nil, trailingDetailText: nil)
                    } header: {
                        Text("Toggle")
                    }
                    Section {
//                        SettingListItemView(leadingImageSystemName: "character.cursor.ibeam", title: "Toggle", underTitle: nil, cellType: .toggle, trailingDetailText: nil, toggleIsOn: false)
                        SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "character.cursor.ibeam", title: "Rename List", underTitle: nil, trailingDetailText: nil)
                    } header: {
                        Text("Ordinary")
                    }
                    Section {
//                        SettingListItemView(leadingImageSystemName: "character.cursor.ibeam", title: "Detail", underTitle: nil, cellType: .detail, trailingDetailText: "Detail Text", toggleIsOn: false)
                        SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "character.cursor.ibeam", title: "Rename List", underTitle: nil, trailingDetailText: nil)
                    } header: {
                            Text("Navigation")
                        }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarTitle(Text("Settings"), displayMode: .inline)
        .navigationBarItems(
            trailing:
                Button {
                    viewModel.buttonTapped()
                } label: {
                    Text("Done")
                        .bold()
                }
        )
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingView(viewModel: SettingViewModel())
                .colorScheme(.dark)
            SettingView(viewModel: SettingViewModel())
                .colorScheme(.light)

            SettingView(viewModel: SettingViewModel())
                .colorScheme(.light)
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")

            SettingView(viewModel: SettingViewModel())
                .colorScheme(.dark)
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")

            SettingView(viewModel: SettingViewModel())
                .previewDevice("iPod touch (7th generation)")
                .colorScheme(.dark)
        }
    }
}
