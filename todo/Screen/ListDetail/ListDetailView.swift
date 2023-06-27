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
                .foregroundColor(.white)
                .padding(.leading, 30)
                .frame(height: 60)
                .font(.system(size: 20))
                .background(.white.opacity(0.5))
                .foregroundColor(.blue)
                .cornerRadius(2)
                .overlay(
                    Button(action: {
                        viewModel.addTask()
                    }, label: {
                        Image(systemName: "circle")
                            .frame(width: 30, height: 30)
                    })
                    .padding(.leading, 2),
                    alignment: .leading
                )
            }
            .padding(.horizontal)
            //            }
            //            .listStyle(PlainListStyle())
        }
    }
}

//struct ListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetailView(viewModel: ListDetailViewModel(taskRepository: TaskRepositoryFake()))
//    }
//}
