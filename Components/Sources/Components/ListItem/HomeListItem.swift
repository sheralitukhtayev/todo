//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 22/06/23.
//

import SwiftUI

public struct HomeListItemView: View {
    let leadingImageSystemName: String?
    let title: String
    let secondaryImage: Bool?
    let trailingImageSystemName: String?

    public init(leadingImageSystemName: String?, title: String, secondaryImage: Bool?, trailingImageSystemName: String?) {
        self.leadingImageSystemName = leadingImageSystemName
        self.title = title
        self.secondaryImage = secondaryImage
        self.trailingImageSystemName = trailingImageSystemName
    }
    public var body: some View {
        HStack {
            if leadingImageSystemName != nil {
                Image(systemName: "list.bullet")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            } else if (leadingImageSystemName == nil) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            }
            if let title {
                Text("\(title)")
                    .font(.system(size: 20))
            }
            if secondaryImage == true {
                Image(systemName: "person.2.fill")
            }
            Spacer()
            if let trailingImageSystemName {
                Text("\(trailingImageSystemName)")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
            }
        }
    }
}
