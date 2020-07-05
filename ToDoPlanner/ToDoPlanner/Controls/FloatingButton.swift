//
//  FloatingButton.swift
//  ToDoPlanner
//
//  Created by Quentin on 2019/11/22.
//  Copyright © 2019 iDEX. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    @EnvironmentObject var categoryManager: CategoryManager
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button(action: {
                    self.categoryManager.AddCategory(name: "Hello")
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .bottomTrailing)
                }
                .padding()
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton().environmentObject(Core.categoryManager)
    }
}
