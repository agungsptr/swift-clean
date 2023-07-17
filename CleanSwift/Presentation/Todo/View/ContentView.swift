//
//  ContentView.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject private var contentVM: ContentViewModel
    
    init(vm: ContentViewModel) {
        self.contentVM = vm
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contentVM.todos) { todo in
                    NavigationLink {
                        VStack {
                            Text(todo.title)
                            Text(todo.desc)
                            Text("\(todo.createdAt, formatter: itemFormatter)")
                            Text("\(todo.id)")
                        }
                    } label: {
                        Text(todo.title)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            contentVM.save()
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let vm = ContentViewModel(context: context)
        ContentView(vm: vm)
            .environment(\.managedObjectContext, context)
    }
}
