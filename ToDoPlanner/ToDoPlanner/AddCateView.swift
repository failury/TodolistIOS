//
//  AddCateView.swift
//  ToDoPlanner
//
//  Created by 杨梓蔚 on 3/6/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct AddCateView: View {
    @Binding var isShowAddCate: Bool
    @State var category = ""
    @Binding var categoryArray: [String]
    
    var body: some View {
        ZStack {
            Rectangle().opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isShowAddCate = false
                        }) {
                            Image(systemName: "delete.left").foregroundColor(Color.black)
                        }.padding()
                    }
                    .frame(height:40)
                    TextField("New Category", text: $category).padding()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.categoryArray.append(self.category)
                            self.isShowAddCate = false
                        }) {
                            Text("Save").foregroundColor(Color.black)
                        }
                    }.padding()
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//struct AddCateView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCateView(isShowAddCate: .constant(true))
//    }
//}

struct AddCateView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
