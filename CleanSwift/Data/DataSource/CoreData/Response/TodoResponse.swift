//
//  TodoCoreDataRes.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

struct TodoResponse {
    private var todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
    
    var id: UUID {
        todo.id!
    }
    var title: String {
        todo.title!
    }
    var desc: String? {
        todo.desc
    }
    var createdAt: Date {
        todo.createdAt!
    }
}
