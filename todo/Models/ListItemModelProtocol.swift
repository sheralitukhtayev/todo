//
//  ListItemModelProtocol.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import Foundation
import CoreData

public protocol ListItemModelProtocol {
    var id: String? { get }
    var name: String? { get }
    var backgroundColor: String? { get }
    var backgroundImage: String? { get }
}

public extension ListItemModelProtocol {
    static func makePredicate(id: String) -> NSPredicate {
        let keyPath = ListItemModel.makePredicate(id: id)
        return NSPredicate(format: "\(keyPath) == %@", id)
    }
}
