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
    @State private var isFaved = false
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.linear) {
                    self.isChecked.toggle()
                }
            }) {
                if self.isChecked {
                    Image(systemName: "largecircle.fill.circle")
                        .getStdFrame()
                    
                } else {
                    Image(systemName: "circle")
                        .getStdFrame()
                }
            }
            .padding(5)
            
            VStack(alignment: .leading) {
                Text("Title")
                    .overlay(self.isChecked ? Rectangle().frame(height: 5) : nil)
                
                Text("Tasks")
                    .font(.footnote)
            }
            
            Spacer()
            
            Button(action: {
                withAnimation(.linear) {
                    self.isFaved.toggle()
                }
            }) {
                if self.isFaved {
                    Image(systemName: "star.fill")
                        .getStdFrame()
                } else {
                    Image(systemName: "star")
                        .getStdFrame()
                }
                
            }
            .padding(5)
        }
        .padding(10)
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
