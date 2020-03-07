//
//  AddCateView.swift
//  ToDoPlanner
//
//  Created by 杨梓蔚 on 3/6/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct AddCateView: View {
    @State var category = ""
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                Image(systemName: "delete.left")
            }
            TextField("New Category", text: $category).padding()
            Button(action: {
                
            }) {
                Text("Save")
            }
        }
    }
}

struct AddCateView_Previews: PreviewProvider {
    static var previews: some View {
        AddCateView()
    }
}
