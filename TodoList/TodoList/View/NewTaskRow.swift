//
//  NewTaskRow.swift
//  TodoList
//
//  Created by Augustin Diabira on 14/07/2022.
//

import SwiftUI

struct NewTaskRow: View {
    @EnvironmentObject var taskModel:TaskModel
    @State var addTask:String = ""
    @State var isDisplayed:Bool
    var body: some View {
        
          
      
            VStack {
                        TextField("Add your task", text: $addTask).padding().background(.gray)
                        
                        Button {
                            taskModel.addTask(task: addTask)
                            addTask = ""
                            
                        } label: {
                            Text("Add Task").foregroundColor(.white)
                        }.padding(14)
                            .frame(width: 300).background(.purple).cornerRadius(50)
            }.frame(width: 450, height: 300).background(Rectangle().fill(Color.white))
        
                
               

            
        
    }
}


