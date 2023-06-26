//
//  CoreDataStack.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import UIKit
import Foundation
import CoreData

class CoreDataStack {
    private let modelName: String

    static var shared = CoreDataStack(modelName: "CoreDataModel")

    init(modelName: String) {
        self.modelName = modelName
    }

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()

    func whereIsMySQLite() {
        let path = NSPersistentContainer
            .defaultDirectoryURL()
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding

        print(path ?? "Not found")
    }

    func saveContext() {
        guard managedContext.hasChanges else {return}

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}

extension NSManagedObject {
    public var classNameMO: String {
        let className = self.description
        return className
    }
}
