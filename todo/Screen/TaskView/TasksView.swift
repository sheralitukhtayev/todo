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
                    viewModel.navigateToTaskDetailView(item: task)
                }, label: {
                    HStack {
                        Button(action: {
                            viewModel.editTask(text: task.name ?? "Undefined", isCompleted: !(task.isCompeleted ?? false), isStared: task.isStared ?? false, taskItem: task)
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
                                .foregroundColor(task.isCompeleted ?? false ? .red : Color(uiColor: .systemGray6))
                            Text("Tasks")
                                .font(.subheadline)
                                .foregroundColor(Color (uiColor: .systemGray6))
                        }
                        .padding(.leading, 15)
                        Spacer()
                        Button(action: {
                            viewModel.editTask(text: task.name ?? "Undefined", isCompleted: task.isCompeleted ?? false, isStared: !(task.isStared ?? false), taskItem: task)
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
                    Button(role: .destructive) {
                        viewModel.deleteTask(task)
                    } label: {
                        Image(systemName: "trash")
                    }

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
