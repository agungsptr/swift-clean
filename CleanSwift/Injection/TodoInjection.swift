//
//  TodoInjection.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import Foundation

struct TodoInjec {
    func todo() -> TodoUseCase {
        let repo = TodoRepositoryImpl(dataSource: TodoDataSourceImpl())
        return TodoUseCaseImpl(repository: repo)
    }
}
