//
//  CreateTask.swift
//  ToDoPlanner
//
//  Created by failury on 1/23/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct CreateTask: View {
    @State var task:String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Add a Task").font(.title).padding()
                TextField("Placeholder", text: $task).padding()
                Spacer()
                }
                .navigationBarItems(leading: Button(action: {
                    
                }) {
                Text("cancel")
                },trailing: Button(action: {
                    
                }) {
                    Text("Save")
                })
                .navigationBarTitle(Text("Create Todo"))
        }
    }
}

struct CreateTask_Previews: PreviewProvider {
    static var previews: some View {
        CreateTask()
    }
}
