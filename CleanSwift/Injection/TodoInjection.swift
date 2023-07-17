//
//  TodoInjection.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation
import CoreData

class TodoInjec {
    private(set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    private func getRepo() -> TodoRepository {
        let todoDataSource: TodoDataSource = TodoDataSourceImpl.shared(context)
        return TodoRepositoryImpl.shared(todoDataSource)
    }
    
    func todo() -> TodoUseCase {
        let repo = getRepo()
        return TodoUseCaseImpl(repository: repo)
    }
}
