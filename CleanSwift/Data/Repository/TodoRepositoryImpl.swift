//
//  TodoRepositoryImpl.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

struct TodoRepositoryImpl: TodoRepository {
    var dataSource: TodoDataSource
    
    func findAll() throws -> [TodoModel] {
        let data = try dataSource.findAll()
        return data
    }
    
    func create(todo: TodoModel) throws -> TodoModel {
        try dataSource.create(todo: todo)
        return todo
    }
}
