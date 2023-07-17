//
//  TodoCoreDataImpl.swift
//  CleanSwift
//
//  Created by Agung Saputra on 17/07/23.
//

import Foundation
import CoreData

struct TodoDataSourceImpl: TodoDataSource {
    private let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CleanSwift")
        container.loadPersistentStores { description, error in
            if error != nil {
                fatalError("Cannot Load Core Data Model")
            }
        }
    }
    
    func findAll() throws -> [TodoModel]{
        let request = Todo.fetchRequest()
        return try container.viewContext.fetch(request).map({ data in
            TodoModel(
                id: data.id!,
                title: data.title!,
                desc: data.desc,
                createdAt: data.createdAt!
            )
        })
    }
    
    func create(todo: TodoModel) throws -> (){
        let todoEntity = Todo(context: container.viewContext)
        todoEntity.id = todo.id
        todoEntity.title = todo.title
        todoEntity.desc = todo.desc
        todoEntity.createdAt = todo.createdAt
        saveContext()
    }
    
    private func saveContext(){
        let context = container.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
