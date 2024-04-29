//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Cansu Özdizlekli on 4/24/24.
//


import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
