//
//  MenuView.swift
//  ToDoPlanner
//
//  Created by 杨梓蔚 on 2/28/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @State var showMainvew: Bool = false
    @State var show = false
    @State var categoryArray : [String] = []
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        ZStack {

            VStack{
                VStack(spacing: 20) {
                    FindButton()
                    HStack{
                        VStack{
                            HighlightButton(showMainvew:$showMainvew)
                            CalendarButton()
                            CompleteButton()
                        }
                        Spacer()
                    }
                    DividerLine()
                    ListView(categoryArray: categoryArray)
                }
                Spacer()
                HStack{
                    Spacer()
                    Addbutton(isShowAddCate: $show)
                }
                
            }
            .overlay(self.show ? AddCateView(isShowAddCate: $show, categoryArray: $categoryArray) : nil)
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.bottom)
            if showMainvew
            {
                MainView(showMainView: $showMainvew).environmentObject(Core.categoryManager)
                
                    .transition(.slide).animation(.easeInOut(duration: 0.8))
            }
        }
        
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
    @Binding var showMainvew: Bool
    var body: some View {
        ZStack {
            Button(action: {
                    self.showMainvew.toggle()
                
            }) {
                HStack (spacing: 10){
                    Image(systemName: "rectangle.3.offgrid.fill").foregroundColor(Color.blue)
                    Text("Highlight").foregroundColor(Color.black)
                }
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
    var categoryArray : [String]
    
    var body: some View{
        List(categoryArray.indices, id: \.self ) { index in
            Text(self.categoryArray[index])
        }
    }
}
