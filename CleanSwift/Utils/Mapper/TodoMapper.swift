//
//  TodoMapper.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

struct TodoMapper {
    private init() {}
    
    static func mapTodoResponsesToDomain(response: [TodoResponse]) -> [TodoModel] {
        var records: [TodoModel] = []
        for res in response {
            let challenge = TodoModel(
                id: res.id,
                title: res.title,
                desc: res.desc ?? "",
                createdAt: res.createdAt
            )
            records.append(challenge)
        }
        return records
    }
    
    static func mapTodoResponseToDomain(response: TodoResponse) -> TodoModel {
        return TodoModel(
            id: response.id,
            title: response.title,
            desc: response.desc ?? "",
            createdAt: response.createdAt
        )
    }
}
