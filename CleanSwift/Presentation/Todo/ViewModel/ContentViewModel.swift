//
//  ContentViewModel.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var todos = [TodoModel]()
    @Published var title = ""
    @Published var desc = ""
    
    private let db: TodoUseCase
    
    init() {
        self.db = TodoInjec().todo()
        findAll()
    }
    
    func findAll() {
        let res = self.db.findAll()
        switch res {
        case .success(let data):
            self.todos = data
        case .failure(let error):
            print(error)
        }
    }
    
    func save() {
        let dataModel = TodoModel(
            id: .init(),
            title: self.title,
            desc: self.desc,
            createdAt: Date()
        )
        let res = self.db.create(todo: dataModel)
        switch res {
        case .success(_):
            self.findAll()
        case .failure(let error):
            print(error)
        }
    }
}
