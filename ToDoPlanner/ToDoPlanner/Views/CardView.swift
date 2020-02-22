//
//  CardView.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/2/7.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var icon: String = "clock"
    var title: String = "Title"
    var description: String = "Description"
    var bgColor: Color = Color.green
    
    @State private var presented = false
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Button(action: {
            self.presented.toggle()
        }) {
            ZStack(alignment: .center) {
                bgColor
                
                HStack {
                    VStack(alignment: .leading) {
                        Image(systemName: icon)
                        
                        Spacer()
                        
                        Text(title)
                            .fontWeight(.semibold)
                        Text(description)
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    .padding()
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack {
                        RingView(percent: .constant(30))
                        .frame(width: 70, height: 70)
                            .padding()
                        Spacer()
                    }
                }
            
            }
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: self.$presented) {
            TaskView()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Title")
            .frame(width: 300, height: 150)
    }
}
