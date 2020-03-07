//
//  MenuView.swift
//  ToDoPlanner
//
//  Created by 杨梓蔚 on 2/28/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @State var show = false
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        VStack{
            VStack (spacing: 20){
                FindButton()
                HStack{
                    VStack{
                        HighlightButton()
                        CalendarButton()
                        CompleteButton()
                    }
                    Spacer()
                }
                DividerLine()
                ListView()
            }
            Spacer()
            HStack{
                Spacer()
                Addbutton(isShowAddCate: $show)
            }
        }
        .overlay(self.show ? AddCateView() : nil)
        .padding()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct FindButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack{
                Image(systemName: "magnifyingglass")
                Text("Quick Find")
            }
        }
        .foregroundColor(Color.black)
        .frame(minWidth:0, maxWidth: .infinity)
        .frame(height: 30)
        .background(RoundedRectangle(cornerRadius: 5))
        .background(Color.gray)
        .opacity(0.15)
    }
}

struct HighlightButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack (spacing: 10){
                Image(systemName: "rectangle.3.offgrid.fill").foregroundColor(Color.blue)
                Text("Highlight").foregroundColor(Color.black)
            }
        }
    }
}

struct CalendarButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack (spacing: 10){
                Image(systemName: "calendar").foregroundColor(Color.red)
                Text("Calendar").foregroundColor(Color.black)                }
        }
    }
}

struct CompleteButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack (spacing: 10){
                Image(systemName: "checkmark.seal.fill").foregroundColor(Color.yellow)
                Text("Complete").foregroundColor(Color.black)
            }
        }
    }
}

struct Addbutton: View {
    @Binding var isShowAddCate: Bool
    
    var body: some View {
        Button(action: {
            self.isShowAddCate = true
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }.padding()
    }
}

struct DividerLine: View {
    var body: some View {
        Divider()
            .frame(height: 1)
            .background(Color.gray)
    }
}

struct ListView: View {
    var category: [String] = []
    var body: some View{
        List(category.indices, id: \.self ) { index in
            Text(self.category[index])
        }
    }
}
