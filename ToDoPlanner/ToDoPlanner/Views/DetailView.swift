//
//  DetailView.swift
//  ToDoPlanner
//
//  Created by failury on 3/6/20.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI
struct StepView: View {
    @State private var isChecked = false
    @State private var isFaved = false
    var Stepcontent: String
    
    var body: some View {
        HStack {
            Image(systemName: "slider.horizontal.3").foregroundColor(.secondary)
            Button(action: {
                withAnimation(.linear) {
                    self.isChecked.toggle()
                }
            }) {
                if self.isChecked {
                    Image(systemName: "largecircle.fill.circle")
                        .getStdFrame().foregroundColor(.secondary)
                    
                } else {
                    Image(systemName: "circle")
                        .getStdFrame().foregroundColor(.secondary)
                }
            }
            .padding(5)
            VStack(alignment: .leading) {
                Text(Stepcontent).font(.body)
            }
            
        }
        .padding(5)
       
    }
}
struct UtilityMenu: View{
    var body:some View{
        VStack(alignment: .leading){
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
           HStack{
                Image(systemName: "tray.2")
                .getStdFrame().foregroundColor(.secondary)
            Text("Choose the Category").font(.headline).foregroundColor(.black)
                }.padding(5)
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                 Image(systemName: "tag")
                 .getStdFrame().foregroundColor(.secondary)
             Text("Tags").font(.headline).foregroundColor(.black)
                 }.padding(5)
             }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                 Image(systemName: "bell")
                 .getStdFrame().foregroundColor(.secondary)
             Text("Remind me").font(.headline).foregroundColor(.black)
                 }.padding(5)
             }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                 Image(systemName: "clock")
                 .getStdFrame().foregroundColor(.secondary)
             Text("Due Date").font(.headline).foregroundColor(.black)
                 }.padding(5)
             }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                 Image(systemName: "person")
                 .getStdFrame().foregroundColor(.secondary)
             Text("Participant").font(.headline).foregroundColor(.black)
                 }.padding(5)
             }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                 Image(systemName: "repeat")
                 .getStdFrame().foregroundColor(.secondary)
             Text("Repeat").font(.headline).foregroundColor(.black)
                 }.padding(5)
             }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            HStack{
                 Image(systemName: "rectangle.and.paperclip")
                 .getStdFrame().foregroundColor(.secondary)
             Text("Attach files").font(.headline).foregroundColor(.black)
                 }.padding(5)
             }
            
        }
    }
}
struct DetailView: View {
    var createTime :String
    var taskName: String
    @State private var isChecked = false
    @State private var isFaved = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack{Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "xmark.circle").font(.largeTitle)
                    .foregroundColor(.black)
                }
                Text("Detail")
                .font(.largeTitle)
                .fontWeight(.bold)
                Spacer()
                Text(createTime).font(.body).foregroundColor(.secondary)
            }.padding()
            HStack{
                Button(action: {
                    withAnimation(.linear) {
                        self.isChecked.toggle()
                    }
                }) {
                    if self.isChecked {
                        Image(systemName: "largecircle.fill.circle")
                            .getStdFrame().foregroundColor(.secondary)
                        
                    } else {
                        Image(systemName: "circle")
                            .getStdFrame().foregroundColor(.secondary)
                    }
                    
                }
                .padding(5)
            
                Text(taskName).bold().font(.headline)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "largecircle.fill.circle")
                .getStdFrame().foregroundColor(.secondary)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "star")
                .getStdFrame().foregroundColor(.secondary)
                }
                
            }.padding()
            ScrollView (){
               ForEach(0...3, id: \.self) { _ in
                   StepView(Stepcontent: "Question 1")
                       .padding(.horizontal, 10)
               }
            }
            .padding()
             UtilityMenu()
            Spacer()
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(createTime: "Created Yesterday",taskName: "ECS 120 Assignment")
    }
}
