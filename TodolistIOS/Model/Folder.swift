//
//  Folder.swift
//  TodolistIOS
//
//  Created by failury on 9/15/19.
//  Copyright © 2019 Ruifeng Zhang. All rights reserved.
//

import Foundation
import RealmSwift

class Folder : Object {
    @objc dynamic var folderName : String = ""
    @objc dynamic var folderColor : String = ""
    let todoItems = List<todoItem>()
}
