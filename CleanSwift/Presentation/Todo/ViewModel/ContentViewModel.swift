//
//  ContentViewModel.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation
import CoreData

@MainActor
class ContentViewModel: NSObject, ObservableObject {
    @Published var todos = [TodoModel]()
    
    private(set) var context: NSManagedObjectContext
    private let db: TodoUseCase
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.db = TodoInjec(context: context).todo()
        super.init()
        findAll()
    }
    
    func findAll() {
        do {
            try db.findAll() { res in
                switch res {
                case .success(let records):
                    self.todos = records
                case .failure(let error):
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func save() {
        do {
            let dataModel = TodoModel(
                id: .init(),
                title: "Hahaha",
                desc: "Yuhuh",
                createdAt: Date()
            )
            try db.create(data: dataModel) { res in
                self.findAll()
                print("berhasil tambah")
            }
        } catch {
            print(error)
        }
    }
}
