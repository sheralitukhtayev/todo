//
//  SwiftUIView.swift
//  
//
//  Created by ithink on 22/06/23.
//

import SwiftUI

public enum CellAccessory {
    case toggle
    case navigation
    case detail
    case ordinary
}

public struct SettingListItemView: View, Identifiable {
    public let id = UUID()
    let cellType: CellAccessory
    let leadingImageSystemName: String?
    let title: String
    let underTitle: String?
    let trailingDetailText: String?
    @State var trailingToggle: Bool = false

    public init(cellType: CellAccessory, trailingToggle: Bool, leadingImageSystemName: String?, title: String, underTitle: String?, trailingDetailText: String?) {
        self.cellType = cellType
        self.leadingImageSystemName = leadingImageSystemName
        self.title = title
        self.underTitle = underTitle
        self.trailingDetailText = trailingDetailText
        self.trailingToggle = trailingToggle

    }

    public var body: some View {
        HStack {
            if cellType == .toggle {
                Toggle(isOn: $trailingToggle) {
                    HStack {
                        if let leadingImageSystemName {
                            Image(systemName: "\(leadingImageSystemName)")
                                .foregroundColor(.gray)
                        }
                        if let underTitle {
                            if !underTitle.isEmpty {
                                VStack(alignment: .leading) {
                                    Text("\(title)")
                                        .font(.system(size: 16))
                                    Text("\(underTitle)")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                            }
                        } else {
                            Text("\(title)")
                                .font(.system(size: 18))
                        }
                    }
                }
            } else if cellType == .ordinary {
                HStack {
                    if let leadingImageSystemName {
                        Image(systemName: "\(leadingImageSystemName)")
                            .foregroundColor(.gray)
                    }
                    if let underTitle {
                        if !underTitle.isEmpty {
                            VStack(alignment: .leading) {
                                Text("\(title)")
                                    .font(.system(size: 16))
                                Text("\(underTitle)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    } else {
                        Text("\(title)")
                            .font(.system(size: 18))
                    }
                }
            } else if cellType == .navigation {
                HStack {
                    if let leadingImageSystemName {
                        Image(systemName: "\(leadingImageSystemName)")
                            .foregroundColor(.gray)
                    }
                    if let underTitle {
                        if !underTitle.isEmpty {
                            VStack(alignment: .leading) {
                                Text("\(title)")
                                    .font(.system(size: 16))
                                Text("\(underTitle)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    } else {
                        Text("\(title)")
                            .font(.system(size: 18))
                    }
                    Spacer()
                    Image(systemName: "arrow.right.to.line")
                }
            } else if cellType == .detail {
                HStack {
                    if let leadingImageSystemName {
                        Image(systemName: "\(leadingImageSystemName)")
                            .foregroundColor(.gray)
                    }
                    if let underTitle {
                        if !underTitle.isEmpty {
                            VStack(alignment: .leading) {
                                Text("\(title)")
                                    .font(.system(size: 16))
                                Text("\(underTitle)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        } else {
                            Text("\(title)")
                                .font(.system(size: 18))
                        }
                    }
                    Spacer()
                    if let trailingDetailText {
                        Text("\(trailingDetailText)")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}
