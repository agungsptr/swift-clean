//
//  File.swift
//  CleanSwift
//
//  Created by Agung Saputra on 17/07/23.
//

import Foundation

protocol TodoUseCase {
    func findAll() -> Result<[TodoModel], TodoError>
    func create(todo: TodoModel) -> Result<TodoModel, TodoError>
}

struct TodoUseCaseImpl: TodoUseCase {
    var repository: TodoRepository
    
    func findAll() -> Result<[TodoModel], TodoError> {
        do {
            let data = try repository.findAll()
            return .success(data)
        } catch {
            return .failure(.FetchError)
        }
    }
    
    func create(todo: TodoModel) -> Result<TodoModel, TodoError> {
        do {
            let data = try repository.create(todo: todo)
            return .success(data)
        } catch {
            return .failure(.CreateError)
        }
    }
}
