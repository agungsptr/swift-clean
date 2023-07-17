//
//  TodoRepository.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

protocol TodoRepository {
    func findAll(completion: @escaping (Result<[TodoModel], Error>) -> Void) throws
    func create(data: TodoModel, completion: @escaping (Result<TodoModel, Error>) -> Void) throws
}
