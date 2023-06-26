//
//  ListItemModel.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import Foundation
import CoreData

public struct ListItemModel: Identifiable, ListItemModelProtocol, Equatable {
    public var id: String?
    public var name: String?
    public var backgroundColor: String?
    public var backgroundImage: String?

    public enum AttributeMO {
        case id(_ value: String?)
        case name(_ value: String?)
        case backgroundColor(_ value: String?)
        case backgroundImage(_ value: String?)
    }

    public enum AttributeName {
        case id
        case name
        case backgroundColor
        case backgroundImage
    }

    public init(
        id: String?,
        name: String?,
        backgroundColor: String?,
        backgroundImage: String?
    ) {
        self.id = id
        self.name = name
        self.backgroundColor = backgroundColor
        self.backgroundImage = backgroundImage
    }
}
