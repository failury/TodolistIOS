//
//  ToDoItem.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/1.
//  Copyright © 2019 iDEX. All rights reserved.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var title : String = ""
    var mark : Bool = false
    
    init(title: String, mark: Bool) {
        self.title = title
        self.mark = mark
    }
}
