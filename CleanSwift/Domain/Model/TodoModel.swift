//
//  Todo.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

struct TodoModel: Identifiable {
    let id: UUID
    let title: String
    let desc: String?
    let createdAt:  Date
}
