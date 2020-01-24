//
//  Folder.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/1.
//  Copyright © 2019 iDEX. All rights reserved.
//

import Foundation
import Combine

class Folder: Identifiable, ObservableObject {
    var id = UUID()
    @Published var folderName : String = ""
    @Published var folderColor : String = ""
    //let todoItems = List<ToDoItem>()
    
    init(name: String, color: String = "red") {
        folderName = name
        folderColor = color
    }
}

class FolderManager: ObservableObject {
    @Published var folders: [Folder] = []
    
    func AddFolder(folder newElement: Folder) {
        self.folders.append(newElement)
    }
    
    func RemoveFolder(index: Int) {
        self.folders.remove(at: index)
    }
}
