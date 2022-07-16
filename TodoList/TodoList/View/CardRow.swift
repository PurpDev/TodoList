//
//  CardRow.swift
//  TodoList
//
//  Created by Augustin Diabira on 16/07/2022.
//

import SwiftUI

struct CardRow: View {
    @State var task:Task
    var body: some View {
        ZStack {
            ZStack {
                withAnimation {
                    Text(task.name).padding().frame(width: 200, height: 100)
                        .background(Rectangle().fill(task.isDone ? Color.green : Color.red).shadow(radius: 9))
                }
               
            }
            
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        CardRow(task: Task(name: "Shoe eommerce app", isDone: false))
    }
}
