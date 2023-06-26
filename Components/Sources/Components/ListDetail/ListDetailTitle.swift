//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 22/06/23.
//

import SwiftUI

public struct ListDetailLabelView: View {
    var title: String

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        Text("\(title)")
            .font(
                .system(size: 34)
                .weight(.heavy)
            )
            .foregroundColor(.gray)
    }
}
