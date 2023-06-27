//
//  TaskModel.swift
//  todo
//
//  Created by ithink on 26/06/23.
//

import CoreData

public struct TaskModel: TaskModelProtocol, Identifiable, Equatable {
    public var id: String?

    public var isCompeleted: Bool?

    public var isStared: Bool?

    public var name: String?

    public var note: String?

    public init(
        id: String? = nil,
        isCompeleted: Bool? = nil,
        isStared: Bool? = nil,
        name: String? = nil, note:
        String? = nil)
    {
        self.id = id
        self.isCompeleted = isCompeleted
        self.isStared = isStared
        self.name = name
        self.note = note
    }

}
