//
//  Folder.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/1.
//  Copyright © 2019 iDEX. All rights reserved.
//

import Foundation
import Combine

class Folder: Hashable, Identifiable, ObservableObject {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Folder, rhs: Folder) -> Bool {
        return lhs.id == rhs.id
    }
    
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
    @Published var folders: [Folder] = [Folder.init(name: "Hello1")]
    
    func AddFolder(folder newElement: Folder) {
        self.folders.append(newElement)
    }
    
    func RemoveFolder(index: Int) {
        self.folders.remove(at: index)
    }
}
