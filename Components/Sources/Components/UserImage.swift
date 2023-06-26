//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 26/06/23.
//

import SwiftUI

public struct UserImage: View {

    public init() {

    }

    public var body: some View {
        Image(systemName: "person.fill")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UserImage()
    }
}
