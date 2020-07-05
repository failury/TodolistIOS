//
//  Step.swift
//  ToDoPlanner
//
//  Created by failury on 7/4/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import Foundation

struct Step: Identifiable {
    var id = UUID()
    var title : String = ""
    var mark : Bool = false
    
    init(title: String, mark: Bool) {
        self.title = title
        self.mark = mark
    }
}
class StepManager {
    var Steps = [Step]()
    
    func AddStep(title: String, mark :Bool) {
        Steps.append(Step(title: title,mark: mark))
    }
    
    func GetStep(id: UUID) -> Step? {
        for step in Steps {
            if step.id == id {
                return step
            }
        }
        return nil
    }
    
    func RemoveStep(id: UUID) {
        for (index, step) in Steps.enumerated() {
            if step.id == id {
                Steps.remove(at: index)
            }
        }
    }
}
