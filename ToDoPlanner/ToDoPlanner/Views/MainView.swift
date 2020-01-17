//
//  MainView.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/8.
//  Copyright © 2019 iDEX. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var foldersManager: FolderManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(foldersManager.folders) { folder in
                    NavigationLink(destination: ToDoItemView()) {
                        Text(folder.folderName)
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.blue, lineWidth: 4)
                    )
                }
                .frame(maxHeight: .infinity)
                .navigationBarTitle("ToDo List")
            }
            
        }
        .overlay(
            FloatingButton()
                .environmentObject(foldersManager)
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Core.foldersManager)
    }
}
