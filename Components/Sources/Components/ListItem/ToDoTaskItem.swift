//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 22/06/23.
//

import SwiftUI

public struct ToDoTaskView: View {
    @State var isChecked: Bool
    @State var isFavorite: Bool
    let title: String
    let underTitle: String?

    public init(isChecked: Bool, isFavorite: Bool, title: String, underTitle: String?) {
        self.isChecked = isChecked
        self.isFavorite = isFavorite
        self.title = title
        self.underTitle = underTitle
    }

    public var body: some View {
        HStack {
            CheckedButton(isChecked: isChecked)
            if let underTitle {
                if !underTitle.isEmpty {
                    VStack(alignment: .leading) {
                        Text("\(title)")
                            .font(.system(size: 18))
                            .font(.headline)
                        HStack {
                            Text("\(underTitle)")
                                .font(.subheadline)
                                .foregroundColor(Color (uiColor: .systemGray6))
                        }
                    }
                }
            } else {
                if let underTitle {
                    Text("\(underTitle)")
                        .font(.system(size: 18))
                        .font(.headline)
                }
            }
            Spacer()
            FavoriteButton(isFavorite: isFavorite)
        }
        .foregroundColor(.white)
        .listRowBackground(
            RoundedRectangle(cornerRadius: 10)
                .background(.clear)
                .foregroundColor(.gray.opacity(0.5))
                .padding(
                    EdgeInsets(
                        top: 3,
                        leading: 10,
                        bottom: 3,
                        trailing: 10
                    )
                )
        )
    }
}

public struct FavoriteButton: View {
    @State var isFavorite: Bool

    public init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }

    public var body: some View {
        Button {
            self.isFavorite.toggle()
        } label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .resizable()
                .frame(width: 20, height: 20)
        }
        .buttonStyle(BorderlessButtonStyle())
        .foregroundColor(.gray)
    }
}

public struct CheckedButton: View {
    @State var isChecked: Bool

    public init(isChecked: Bool) {
        self.isChecked = isChecked
    }

    public var body: some View {
        Button {
            self.isChecked.toggle()
        } label: {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
        }
        .buttonStyle(BorderlessButtonStyle())
        .foregroundColor(.gray)
    }
}
