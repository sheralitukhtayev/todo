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

    @State var circleIcon = "circle"
    @State var starIcon = "star"

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    viewModel.isCompleted.toggle()
                    viewModel.editTask(text: viewModel.selectedTaskItem?.name ?? "", isCompleted: !(self.viewModel.selectedTaskItem?.isCompeleted ?? false), isStared: self.viewModel.selectedTaskItem?.isStared ?? false, taskItem: viewModel.selectedTaskItem!)
                }) {
                    Image(systemName: "\(viewModel.isCompleted ? "circle.fill" : "circle")")
                }
                ListDetailLabelView(title: "\(viewModel.selectedTaskItem?.name ?? "Undefined")")
                Spacer()
                Button(action: {
                    viewModel.isStared.toggle()
                    viewModel.editTask(text: viewModel.selectedTaskItem?.name ?? "", isCompleted: self.viewModel.selectedTaskItem?.isCompeleted ?? false, isStared: !(self.viewModel.selectedTaskItem?.isStared ?? false), taskItem: viewModel.selectedTaskItem!)
                }) {
                    Image(systemName: "\(viewModel.isStared ? "star.fill" : "star")")
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
