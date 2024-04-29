//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/24/24.
//

import FirebaseFirestoreSwift
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel :ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        //users/<userid>/todos/entries
        
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
        }.sheet(isPresented: $viewModel.showingNewItemView) {
            NewItemView(newItemPresented: $viewModel.showingNewItemView)
        }
        
    }
}

#Preview {
    ToDoListView(userId: "ySCNljI0rGXXZbN7fidYVktXEao1")
}
