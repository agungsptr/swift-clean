//
//  TodoRepository.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

protocol TodoRepository {
    func findAll() throws -> [TodoModel]
    func create(todo: TodoModel) throws -> TodoModel
}
