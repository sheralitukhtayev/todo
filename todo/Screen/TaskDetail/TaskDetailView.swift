//
//  TaskDetailView.swift
//  todo
//
//  Created by ithink on 27/06/23.
//

import SwiftUI
import Components

struct TaskDetailView: View {
    @ObservedObject var viewModel: TaskDetailViewModel

    init(viewModel: TaskDetailViewModel) {
        self.viewModel = viewModel
    }
    @State var text = ""
    @State var circleIcon = "circle"
    @State var starIcon = "star"

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    viewModel.isCompleted.toggle()
                    viewModel.editTask(text: viewModel.selectedTaskItem?.name ?? "", isCompleted: self.viewModel.isCompleted, isStared: self.viewModel.isStared , taskItem: viewModel.selectedTaskItem!, note: self.viewModel.noteText)
                }) {
                    Image(systemName: "\(viewModel.isCompleted ? "checkmark.circle.fill" : "circle")")
                        .font(.system(size: 24))
                        .foregroundStyle(Palette.current.taskBackgroundColor.suiColor)
                }
                if #available(iOS 16.0, *) {
                    TextField("Welcome", text: $viewModel.taskText)
                        .font(.system(size: 20))
                        .foregroundStyle(Palette.current.taskForegroundColor.suiColor)
                        .strikethrough(viewModel.isCompleted ? true : false)
                } else {
                }

                Spacer()
                Button(action: {
                    viewModel.isStared.toggle()
                    viewModel.editTask(text: viewModel.selectedTaskItem?.name ?? "", isCompleted: self.viewModel.isCompleted, isStared: self.viewModel.isStared , taskItem: viewModel.selectedTaskItem!, note: self.viewModel.noteText)
                }) {
                    Image(systemName: "\(viewModel.isStared ? "star.fill" : "star")")
                        .font(.system(size: 24))
                        .foregroundStyle(Palette.current.taskBackgroundColor.suiColor)
                }
            }
            .padding(.horizontal)
            List {
                Section("Note") {
                    Button {
                        viewModel.openNote(task: viewModel.selectedTaskItem!)
                    } label: {
                        if (viewModel.selectedTaskItem?.note != nil) {
                            Text(viewModel.noteText)
                                .foregroundColor(Palette.current.taskForegroundColor.suiColor)
                        } else {
                            Text(viewModel.noteText)
                                .foregroundColor(Palette.current.taskForegroundColor.suiColor)
                        }
                    }
                    .frame(height: 50)
                }
            }
            Spacer()
            Button(role: .destructive) {
                viewModel.dismissView(viewModel.selectedTaskItem!)
            } label: {
                Image(systemName: "trash.fill")
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(viewModel: TaskDetailViewModel(taskRepository: TaskRepositoryFake()))
    }
}
