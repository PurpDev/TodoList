//
//  ContentView.swift
//  TodoList
//
//  Created by Augustin Diabira on 14/07/2022.
//

import SwiftUI


struct ContentView: View {
   
    @EnvironmentObject var taskModel:TaskModel
    @State var isDisplayed:Bool = false
    @State var isShowinDone = false
    @State var isShowingUnfinished = false
    @State var cardMode = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    if !cardMode {
                        ScrollView(.horizontal){
                            HStack(spacing: 50) {
                                
                                Button {
                                    isShowinDone = false
                                    isShowingUnfinished = false
                                } label: {
                                    
                                    Text("All Tasks").bold()
                                }.padding()
                                Button {
                                    isShowinDone = false
                                    isShowingUnfinished = true
                                } label: {
                                    Text("Unfinished Task").bold()
                                }
                                Button {
                                    isShowingUnfinished = false
                                    isShowinDone = true
                                } label: {
                                    Text("Done Task").bold()
                                }

                                
                                
                            }
                            
                           
                        }
                    }
                    
                    if !cardMode {
                        List {
                            
                            if isShowinDone {
                                
                           
                                    ForEach(taskModel.DoneTaskList()){task in
                                        TaskRow(task: task).onTapGesture {
                                            taskModel.changeDoneToggle(task: task)
                                        }
                                }

                                .onDelete { index in
                                    taskModel.deleteTask(task: index)
                                }
                            }else if isShowingUnfinished {
                                ForEach(taskModel.UnfinishedTask()){task in
                                    TaskRow(task: task).onTapGesture {
                                        taskModel.changeDoneToggle(task: task)
                                    }

                                }.onDelete { index in
                                    taskModel.deleteTask(task: index)
                                }
                            }else {
                                ForEach(taskModel.model){task in
                                    TaskRow(task: task).onTapGesture {
                                        taskModel.changeDoneToggle(task: task)
                                    }
                                }.onDelete { index in
                                    taskModel.deleteTask(task: index)
                                }.onMove(perform: taskModel.moveTask)
                            }
                           
                            
                        }
                    }else {
                       CardList()
                    }
                        
                }.background()
                        .listStyle(.plain)
                        .toolbar {
                            HStack (spacing: 110){
                                
                                Button {
                                    cardMode.toggle()
                                } label: {
                                    Image(systemName: "creditcard")
                                }


                               
                                Text("My Tasks")
                                
                                Button {
                                    isDisplayed.toggle()
                                } label: {
                                    Text("New")
                                }
                            }
                    }
                if isDisplayed {
                    withAnimation {
                        NewTaskRow( isDisplayed: isDisplayed).offset(x: 5, y: 290)
                    }.animation(.easeIn(duration: 8.0), value: 84)
                   
                    
                    
                }
               
               
            }.navigationTitle("Tasks")
            }

        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().preferredColorScheme(.dark).environmentObject(TaskModel())
            
        }
    }
}
