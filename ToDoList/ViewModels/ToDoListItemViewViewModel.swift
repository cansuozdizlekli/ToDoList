//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/24/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for single todo list item view (each row in items list)
class ToDoListItemViewViewModel : ObservableObject {
    init() {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
