//
//  todoItems.swift
//  TodolistIOS
//
//  Created by failury on 9/15/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import Foundation
import RealmSwift
class todoItem : Object{
    @objc dynamic var title : String = ""
    @objc dynamic var mark : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentFolder = LinkingObjects(fromType: Folder.self, property: "todoItems")
}
