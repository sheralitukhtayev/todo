//
//  File.swift
//  
//
//  Created by ithink on 26/06/23.
//

import SwiftUI

public struct TaskItemView: View {

    var name : String
    @State var completed: Bool
    @State var stared : Bool

    public init(name: String, completed: Bool, stared: Bool) {
        self.name = name
        self.completed = completed
        self.stared = stared
    }

    public var body: some View {
        HStack {
            Button(action: {
                self.completed.toggle()
            }) {
                if completed == false {
                    Image(systemName: "circle")
                } else {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            VStack(alignment: .leading) {
                Text("\(name)")
                    .font(.headline)
                Text("Tasks")
                    .font(.subheadline)
                    .foregroundColor(Color (uiColor: .systemGray6))
            }
            .padding(.leading, 15)
            Spacer()
            Button(action: {
                self.stared.toggle()
            }) {
                if stared == false {
                    Image(systemName: "star")
                } else {
                    Image(systemName: "star.fill")
                }
            }
        }
    }
}
