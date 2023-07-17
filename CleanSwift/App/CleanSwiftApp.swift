//
//  CleanSwiftApp.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import SwiftUI

@main
struct CleanSwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(vm: ContentViewModel(context: persistenceController.container.viewContext))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
