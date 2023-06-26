//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 22/06/23.
//

import SwiftUI

public struct ListDetailTextFieldView: View {
    @State var text: String

    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        ZStack {
            HStack {
                TextField(
                    "",
                    text: $text
                )
                .foregroundColor(.white)
                .padding(.leading, 30)
                .frame(height: 60)
                .font(.system(size: 20))
                .background((Color.gray.opacity(0.7)))
                .foregroundColor(.white)
                .accentColor(Color.white)
                .cornerRadius(16)
                .overlay(
                    Button(action: {

                    }, label: {
                        Image(systemName: "circle")
                            .frame(width: 30, height: 30)
                    })
                    .padding(.leading, 2),
                    alignment: .leading
                )
            }
        }
    }
}

