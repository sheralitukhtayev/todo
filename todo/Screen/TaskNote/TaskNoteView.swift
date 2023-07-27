//
//  TaskNoteView.swift
//  todo
//
//  Created by ithink on 04/07/23.
//

import SwiftUI

struct TaskNoteView: View {

    @ObservedObject var viewModel: TaskDetailViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                TextField("", text: $viewModel.noteText)
                    .foregroundColor(Palette.current.taskForegroundColor.suiColor)
                    .padding()
                Spacer()
            }
        }
        .navigationTitle("Note")
    }
}

//struct TaskNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskNoteView(viewModel: Task)
//    }
//}
