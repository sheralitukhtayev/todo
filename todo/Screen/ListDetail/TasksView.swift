//
//  TasksView.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import SwiftUI
import Components

struct TaskView: View {

    @ObservedObject var viewModel: ListDetailViewModel

    public init(viewModel: ListDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            List(viewModel.taskItems) { task in
                Button(action: {

                }, label: {
                    HStack {
                        Button(action: {
                            viewModel.isCompleted.toggle()
                            viewModel.editTask(at: "\(task.id)", text: "\(task.name)", isCompleted: viewModel.isCompleted, isStared: viewModel.isStared)
                        }) {
                            if task.isCompeleted == false {
                                Image(systemName: "circle")
                            } else {
                                Image(systemName: "circle.fill")
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("\(task.name ?? "undefined")")
                                .font(.headline)
                            Text("Tasks")
                                .font(.subheadline)
                                .foregroundColor(Color (uiColor: .systemGray6))
                        }
                        .padding(.leading, 15)
                        Spacer()
                        Button(action: {
                            viewModel.isStared.toggle()
                            viewModel.editTask(at: "\(task.id)", text: "\(task.name)", isCompleted: viewModel.isCompleted, isStared: viewModel.isStared)
                        }) {
                            if task.isStared == false {
                                Image(systemName: "star")
                            } else {
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                })
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: {
                        viewModel.deleteTask(task)
                    }) {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                }
                .foregroundColor(.white.opacity(0.5))
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 0)
                        .background(.white.opacity(0.5))
                        .foregroundColor(.black.opacity(0.5))
                )
            }
            .listStyle(.plain)
        }
    }
}
