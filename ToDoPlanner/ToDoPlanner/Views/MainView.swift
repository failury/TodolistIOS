//
//  MainView.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/8.
//  Copyright © 2019 iDEX. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct MainView: View {
    var ToDoData: [ToDoItem] = [
        ToDoItem(title: "Task 1", mark: false),
        ToDoItem(title: "Task 2", mark: false),
        ToDoItem(title: "Task 3", mark: false),
        ToDoItem(title: "Task 4", mark: false),
        ToDoItem(title: "Task 5", mark: false),
        ToDoItem(title: "Task 6", mark: false),
        ToDoItem(title: "Task 7", mark: false),
        ToDoItem(title: "Task 8", mark: false),
        ToDoItem(title: "Task 9", mark: false),
        ToDoItem(title: "Task 10", mark: false)
    ]
    
    @State var index = 0
    @EnvironmentObject var foldersManager: FolderManager
    
    var body: some View {
//        NavigationView {
//            ScrollView {
//                ForEach(foldersManager.folders) { folder in
//                    NavigationLink(destination: ToDoItemView()) {
//                        Text(folder.folderName)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.blue, lineWidth: 4)
//                    )
//                }
//                .frame(maxHeight: .infinity)
//                .navigationBarTitle("ToDo List")
//            }
//
//        }
//        .overlay(
//            FloatingButton()
//                .environmentObject(foldersManager)
//        )
        WaterfallGrid(ToDoData) { item in
            CardView(title: item.title)
                .frame(maxWidth: UIScreen.main.bounds.width / 2)
                .frame(height: 150)
        }.gridStyle(columns: 2, padding: EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Core.foldersManager)
    }
}
