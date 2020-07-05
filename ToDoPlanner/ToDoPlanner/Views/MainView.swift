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
    var ToDoData: [Task] = [
        Task(title: "Task 1", mark: false, cate: "task"),
        Task(title: "Task 2", mark: false, cate: "task"),
        Task(title: "Task 3", mark: false, cate: "task"),
        Task(title: "Task 4", mark: false, cate: "task"),
        Task(title: "Task 5", mark: false, cate: "task"),
        Task(title: "Task 6", mark: false, cate: "task"),
        Task(title: "Task 7", mark: false, cate: "task"),
        Task(title: "Task 8", mark: false, cate: "task"),
        Task(title: "Task 9", mark: false, cate: "task"),
        Task(title: "Task 10", mark: false, cate: "task")
    ]
    
    @State var index = 0
    @EnvironmentObject var categoryManager: CategoryManager
    @Binding var showMainView: Bool
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
        VStack(alignment: .leading) {
            Button(action: {self.showMainView.toggle()}) {
                        Text("Hightlight")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            }
            
            WaterfallGrid(self.ToDoData) { item in
                CardView(title: item.title)
                    .frame(width: 180)
                    .frame(maxHeight: .infinity)
            }
            .frame(height: 250)
            .frame(maxWidth: .infinity)
            .gridStyle(columns: 2,
                       padding: EdgeInsets(top: 0,
                                           leading: 10,
                                           bottom: 10,
                                           trailing: 10)
            )
            .scrollOptions(direction: .horizontal, showsIndicators: true)
            .padding(.top, -15)
            
            ScrollView {
                ForEach(0...10, id: \.self) { _ in
                    ItemView()
                        .padding(.horizontal, 10)
                }
            }
           
        }.background(Color.white)
    }
}

