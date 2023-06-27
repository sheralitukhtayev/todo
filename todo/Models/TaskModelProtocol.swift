//
//  TaskModelProtocol.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import Foundation
import CoreData

public protocol TaskModelProtocol {
    var id: String? { get } 
    var isCompeleted: Bool? { get }
    var isStared: Bool? { get }
    var name: String? { get }
    var note: String? { get }
}

public extension TaskModelProtocol {
    static func makePredicate(id: String) -> NSPredicate {
        let keyPath = ListItemModel.makePredicate(id: id)
        return NSPredicate(format: "\(keyPath) == %@", id)
    }
}
