//
//  ContentView.swift
//  CleanSwift
//
//  Created by Agung Saputra on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var contentVM = ContentViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contentVM.todos) { todo in
                    NavigationLink {
                        VStack {
                            Text(todo.title)
                            Text(todo.desc ?? "")
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
//                        withAnimation(.easeInOut(duration: 0.25)) {
//                            contentVM.save()
//                        }
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                VStack {
                    Form {
                        TextField("Title", text: $contentVM.title)
                        TextField("Description", text: $contentVM.desc)
                    }
                    Button {
                        contentVM.save()
                        showingSheet.toggle()
                    } label: {
                        Text("Save")
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
        ContentView()
    }
}
