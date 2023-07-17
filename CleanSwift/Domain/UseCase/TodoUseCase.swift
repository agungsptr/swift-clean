//
//  TodoUseCase.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

protocol TodoUseCase {
    func findAll(
        completion: @escaping (Result<[TodoModel], Error>) -> Void
    ) throws
    func create(
        data: TodoModel,
        completion: @escaping (Result<TodoModel, Error>) -> Void
    ) throws
}

class TodoUseCaseImpl: TodoUseCase {
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func findAll(
        completion: @escaping (Result<[TodoModel], Error>) -> Void
    ) throws {
        try repository.findAll() { res in
            completion(res)
        }
    }
    
    func create(
        data: TodoModel,
        completion: @escaping (Result<TodoModel, Error>) -> Void
    ) throws {
        try repository.create(data: data) { res in
            completion(res)
        }
    }
}
