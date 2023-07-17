//
//  TodoCoreDataImpl.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

protocol TodoDataSource {
    func findAll() throws -> [TodoModel]
    func create(todo: TodoModel) throws -> ()
}

