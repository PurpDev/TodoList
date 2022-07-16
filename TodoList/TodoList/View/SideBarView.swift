//
//  SideBarView.swift
//  TodoList
//
//  Created by Augustin Diabira on 16/07/2022.
//

import SwiftUI

struct SideBarView: View {
    let sidebarItems = ["All Tasks", "Completed Tasks", "Unfinished Tasks"]
    
    var body: some View {
        List {
            ForEach(sidebarItems, id:\.self){button in
                Button {
                    
                } label: {
                    Text(button).tag(button)
                }


               
            }
        }.navigationTitle("Edit List of Tasks")
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
