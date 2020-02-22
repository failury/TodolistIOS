//
//  ItemView.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/2/21.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    @State private var isChecked = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.isChecked.toggle()
            }) {
                if (self.isChecked) {
                    Image(systemName: "largecircle.fill.circle")
                        .animation(.linear)
                } else {
                    Image(systemName: "circle")
                        .animation(.linear)
                }
            }
            
            VStack {
                Text("Title")
                Text("Tasks")
            }
            
            Image(systemName: "")
            
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
