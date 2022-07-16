//
//  TaskRow.swift
//  TodoList
//
//  Created by Augustin Diabira on 15/07/2022.
//

import SwiftUI

struct TaskRow: View {
    @State var task:Task
        var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle" : "circle").foregroundColor(task.isDone ? .green : .red)

            }

            Text(task.name)
        }.padding(.trailing)
    }
}


