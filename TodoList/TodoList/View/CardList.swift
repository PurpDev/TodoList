//
//  CardList.swift
//  TodoList
//
//  Created by Augustin Diabira on 16/07/2022.
//

import SwiftUI

struct CardList: View {
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())]
    @EnvironmentObject var taskModel:TaskModel
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: gridItems,spacing: 20, content: {
                    ForEach(taskModel.model){boom in
                        CardRow(task: boom).onTapGesture {
                            taskModel.changeDoneToggle(task: boom)
                        }.rotation3DEffect(.degrees(0.0), axis: (x: 1, y: 3, z: 0))
                        
                    }
                    
                }
                          
            )}
        }
                      
                      }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(TaskModel())
    }
}
