//
//  ToDoItem.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/1.
//  Copyright © 2019 iDEX. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title : String = ""
    var mark : Bool = false
    var isFinished = false
    var isFaved = false
    var cate = "Task"
    var InheretedSteps : StepManager?
    init(title: String, mark: Bool, cate: String) {
        self.title = title
        self.mark = mark
    }
}
class TaskManager {
    var tasks = [Task]()
    
    func AddTask(title: String, cate : String) {
        tasks.append(Task(title: title, mark: false, cate: cate))
    }
    
    func GetTask(id: UUID) -> Task? {
        for task in tasks {
            if task.id == id {
                return task
            }
        }
        return nil
    }
    
    func RemoveTask(id: UUID) {
        for (index, task) in tasks.enumerated() {
            if task.id == id {
                tasks.remove(at: index)
            }
        }
    }
}
