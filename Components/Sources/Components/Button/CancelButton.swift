//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 22/06/23.
//

import SwiftUI

public struct CancelButtonView: View {
    let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        Button("Cancel", action: action)
    }
}
