//
//  SearchIcon.swift
//  
//
//  Created by ithink on 26/06/23.
//

import SwiftUI

public struct SearchIcon: View {

    public init() {

    }

    public var body: some View {
        Image(systemName: "magnifyingglass")
    }
}

struct SearchIcon_Previews: PreviewProvider {
    static var previews: some View {
        SearchIcon()
    }
}
