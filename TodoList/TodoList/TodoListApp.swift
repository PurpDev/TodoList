//
//  TodoListApp.swift
//  TodoList
//
//  Created by Augustin Diabira on 14/07/2022.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var taskModel:TaskModel = TaskModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(taskModel)
        }
    }
}
