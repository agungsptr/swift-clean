//
//  TodoRepositoryImpl.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

class TodoRepositoryImpl: TodoRepository {
    static let shared: (TodoDataSource) -> TodoRepository = { dataSource in
        return TodoRepositoryImpl(dataSource: dataSource)
    }
    
    private let dataSource: TodoDataSource
    
    init(dataSource: TodoDataSource) {
        self.dataSource = dataSource
    }
    
    func findAll(
        completion: @escaping (Result<[TodoModel], Error>) -> Void
    ) throws {
        try dataSource.findAll() { res in
            switch res {
            case .success(let todos):
                let data = TodoMapper.mapTodoResponsesToDomain(response: todos)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func create(
        data: TodoModel,
        completion: @escaping (Result<TodoModel, Error>) -> Void
    ) throws {
        try dataSource.create(data: data) { res in
            switch res {
            case .success(let todo):
                let dataRes = TodoMapper.mapTodoResponseToDomain(response: todo)
                completion(.success(dataRes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
