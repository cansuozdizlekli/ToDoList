//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/24/24.
//
import FirebaseAuth
import Foundation

class MainViewViewModel : ObservableObject {
    @Published var currentUserId : String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ _, user in
            DispatchQueue.main.async {
                self.currentUserId = user?.uid ?? ""
            }
        })
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
