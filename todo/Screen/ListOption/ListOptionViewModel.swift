//
//  ListOptionViewModel.swift
//  TODO_APP
//
//  Created by ithink on 23/06/23.
//

import SwiftUI
import Components

final class ListOptionViewModel {

}

let listOptionArray = [
    SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "character.cursor.ibeam", title: "Rename List", underTitle: nil, trailingDetailText: nil),
    SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "calendar.day.timeline.leading", title: "Sort", underTitle: nil, trailingDetailText: nil),
    SettingListItemView(cellType: .navigation, trailingToggle: false, leadingImageSystemName: "filemenu.and.selection", title: "Change Theme", underTitle: nil, trailingDetailText: nil),
    SettingListItemView(cellType: .ordinary, trailingToggle: false, leadingImageSystemName: "trash", title: "Delete List", underTitle: nil, trailingDetailText: nil)
]
