//
//  ToDoItem.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/1.
//  Copyright © 2019 iDEX. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoItem : Object{
    @objc dynamic var title : String = ""
    @objc dynamic var mark : Bool = false
    var parentFolder = LinkingObjects(fromType: Folder.self, property: "todoItems")
}
