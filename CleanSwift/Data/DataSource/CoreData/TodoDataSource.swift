//
//  TodoCoreDataImpl.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation
import CoreData

protocol TodoDataSource {
    func findAll(
        completion: @escaping (Result<[TodoResponse], Error>) -> Void
    ) throws
    func create(
        data: TodoModel,
        completion: @escaping (Result<TodoResponse, Error>) -> Void
    ) throws
}

struct TodoDataSourceImpl: TodoDataSource {
    static let shared: (NSManagedObjectContext) -> TodoDataSource = { context in
        return TodoDataSourceImpl(context: context)
    }
    
    private let fetchedResultsController: NSFetchedResultsController<Todo>
    private(set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        let request = Todo.fetchRequest()
        request.sortDescriptors = []
        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
    }
    
    func findAll(
        completion: @escaping (Result<[TodoResponse], Error>) -> Void
    ) throws {
        do {
            try fetchedResultsController.performFetch()
            guard let todos = fetchedResultsController.fetchedObjects else {
                return
            }
            completion(.success(todos.map(TodoResponse.init)))
        } catch {
            print(error)
            completion(.failure(error))
        }
    }
    
    func create(
        data: TodoModel,
        completion: @escaping (Result<TodoResponse, Error>) -> Void
    ) throws {
        do {
            let todo = Todo(context: self.context)
            todo.id = data.id
            todo.title = data.title
            todo.desc = data.desc
            todo.createdAt = data.createdAt
            try self.context.save()
            completion(.success(TodoResponse.init(todo: todo)))
        } catch {
            print(error)
            completion(.failure(error))
        }
    }
}
