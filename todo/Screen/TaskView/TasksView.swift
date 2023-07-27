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

    @Environment(\.managedObjectContext) var managedObjectContext

    public init(viewModel: ListDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            List {
                ForEach(viewModel.taskItems) { task in
                    Button(action: {
                        viewModel.navigateToTaskDetailView(item: task)
                    }, label: {
                        HStack {
                            Button(action: {
                                viewModel.editTask(text: task.name ?? "Undefined", isCompleted: !(task.isCompeleted ?? false), isStared: task.isStared ?? false, taskItem: task, note: task.note ?? "")
                            }) {
                                if task.isCompeleted == false {
                                    Image(systemName: "circle")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Palette.current.taskIconColor.suiColor)
                                } else {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Palette.current.taskIconColor.suiColor)
                                }
                            }
                            VStack(alignment: .leading) {
                                if #available(iOS 16.0, *) {
                                    Text("\(task.name ?? "undefined"): Order-\(task.order!)")
                                        .font(.headline)
                                        .foregroundStyle(Palette.current.taskForegroundColor.suiColor)
                                        .strikethrough(task.isCompeleted ?? false ? true : false)
                                } else {
                                }
                                Text(task.note?.isEmpty ?? true ? "Task" : "Task \(Image(systemName: "dot.square")) Note")
                                    .font(.subheadline)
                                    .foregroundStyle(Palette.current.taskIconColor.suiColor)
                            }
                            Spacer()
                            Button(action: {
                                viewModel.editTask(text: task.name ?? "Undefined", isCompleted: task.isCompeleted ?? false, isStared: !(task.isStared ?? false), taskItem: task, note: task.note ?? "")
                            }) {
                                if task.isStared == false {
                                    Image(systemName: "star")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Palette.current.taskIconColor.suiColor)
                                } else {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Palette.current.taskIconColor.suiColor)
                                }
                            }
                        }
                    })
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            viewModel.editTaskText(item: task)
                        } label: {
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        }
                        .tint(.blue)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            viewModel.deleteTaskItem(item: task)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }

                }
                .onMove(perform: { indexSet, int in
                    viewModel.move(from: indexSet, to: int)
                })
                .listRowSeparator(.visible)
                .foregroundColor(Palette.current.taskForegroundColor.suiColor)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Palette.current.taskBackgroundColor.suiColor)
                )
            }
            .listStyle(.plain)
        }
    }
}
