//
//  FloatingControl.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/3/6.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct FloatingControl<Content: View>: View {
    let rightButton: Content
    let leftButton: Content
    
    init(@ViewBuilder right: () -> Content, @ViewBuilder left: () -> Content) {
        self.rightButton = right()
        self.leftButton = left()
    }
    
    var body: some View {
        HStack {
            rightButton
            leftButton
        }
        
    }
}

struct FloatingControl_Previews: PreviewProvider {
    static var previews: some View {
        FloatingControl(right: {
            Text("Button1")
        }, left: {
            Text("Button2")
        })
    }
}
