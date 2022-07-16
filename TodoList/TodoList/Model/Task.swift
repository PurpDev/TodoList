//
//  Task.swift
//  TodoList
//
//  Created by Augustin Diabira on 14/07/2022.
//

import Foundation

struct Task: Identifiable {
    var id:String
    var name:String
    var isDone:Bool
    
    
    init(id:String = UUID().uuidString, name:String, isDone:Bool){
        self.id = id
        self.name = name
        self.isDone = isDone
    }
    func toggleCheck() -> Task {
        
        return Task(name: name, isDone: !isDone)
    }

    
}


