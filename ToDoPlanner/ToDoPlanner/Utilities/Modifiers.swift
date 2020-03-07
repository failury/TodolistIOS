//
//  Modifiers.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/3/2.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct StdIconFrame: ViewModifier {
    func body(content: Content) -> some View {
        return content.frame(width: 20, height: 20)
    }
}

//struct Modifiers_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}
