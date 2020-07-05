//
//  Category.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/5/1.
//  Copyright © 2020 iDEX. All rights reserved.
//

import Foundation

class Category:Identifiable,ObservableObject {
    var id = UUID()
    @Published var cateName: String!
    var InheretedTasks : TaskManager?
    
    init(name: String) {
        self.cateName = name
    }
    
    
}

class CategoryManager: ObservableObject {
    @Published var categories = [Category]()
    
    func AddCategory(name: String) {
        categories.append(Category(name: name))
    }
    
    func GetCategory(id: UUID) -> Category? {
        for cate in categories {
            if cate.id == id {
                return cate
            }
        }
        return nil
    }
    
    func RemoveCategory(id: UUID) {
        for (index, cate) in categories.enumerated() {
            if cate.id == id {
                categories.remove(at: index)
            }
        }
    }
}

