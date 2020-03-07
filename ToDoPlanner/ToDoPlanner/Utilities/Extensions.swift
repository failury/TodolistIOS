//
//  Extensions.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/3/2.
//  Copyright © 2020 iDEX. All rights reserved.
//

//import Foundation
import SwiftUI

extension Image {
    func getStdFrame() -> some View {
        self.resizable().modifier(StdIconFrame())
    }
}
