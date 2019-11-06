//
//  Folder.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/1.
//  Copyright © 2019 iDEX. All rights reserved.
//

import Foundation
import RealmSwift

class Folder : Object {
    @objc dynamic var folderName : String = ""
    @objc dynamic var folderColor : String = ""
    let todoItems = List<ToDoItem>()
}
