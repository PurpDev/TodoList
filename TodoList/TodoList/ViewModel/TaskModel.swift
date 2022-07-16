//
//  TaskModel.swift
//  TodoList
//
//  Created by Augustin Diabira on 16/07/2022.
//

import Foundation

class TaskModel:ObservableObject {
    @Published var model:[Task] = []
    
    init (){
        getTask()
    }
    func getTask() {
        let tasks:[Task] = [
        Task( name: "Release something on the App store", isDone: false),
        Task( name: "Pokedex project with pokemon API", isDone: true),
        Task( name: "Shoe ecommerce App", isDone: true),
        ]
        model.append(contentsOf: tasks)
    }
    
    func deleteTask(task: IndexSet){
        model.remove(atOffsets: task)
    }
    
    func addTask(task: String){
        let newTask = Task(name: task, isDone: false)
        model.append(newTask)
        
    }
    
    func DoneTaskList() -> [Task]{
      let filtre =  model.filter { task in
            return task.isDone
        }
        return filtre
    }
    
    func UnfinishedTask() -> [Task]{
        return model.filter{task in return !task.isDone}
    }
    
    func moveTask(nkd: IndexSet, toleka: Int) {
        model.move(fromOffsets: nkd, toOffset: toleka)
    }
    
    func changeDoneToggle(task: Task) {
        
        if let toggle = model.firstIndex(where: {$0.id == task.id}){
            model[toggle] = task.toggleCheck()
        }
        
    }
    
    }
