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
            //            List {
            VStack(alignment: .leading) {
                ListDetailLabelView(title: "\(viewModel.selectedList?.name ?? "Undefined")")
                TaskView(viewModel: viewModel)
                Spacer()
                TextField(
                    "",
                    text: $viewModel.taskText
                )
                .foregroundColor(Palette.current.taskForegroundColor.suiColor)
                .padding(.leading, 40)
                .frame(height: 60)
                .font(.system(size: 20))
                .background(Palette.current.taskBackgroundColor.suiColor)
                .foregroundColor(.blue)
                .cornerRadius(2)
                .overlay(
                    Button(action: {
                        viewModel.addTask()
                    }, label: {
                        Image(systemName: "circle")
                            .font(.system(size: 20))
                            .padding(.leading, 10)
                            .foregroundStyle(.white)
                    })
                    .padding(.leading, 0),
                    alignment: .leading
                )
            }
            .padding(.horizontal)
        }
    }
}
