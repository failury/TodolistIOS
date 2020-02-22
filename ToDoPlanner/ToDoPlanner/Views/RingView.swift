//
//  RingView.swift
//  ToDoPlanner
//
//  Created by Quentin on 2020/2/21.
//  Copyright © 2020 iDEX. All rights reserved.
//

import SwiftUI

struct RingView: View {
    let rotation: Double = 270
    let lineWidth: CGFloat = 6
    let underColor: Color = Color.gray.opacity(0.3)
    let upperColor: Color = Color.red
    
    @Binding var percent: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(underColor, lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: percent / CGFloat(100))
                .stroke(upperColor,
                        style: StrokeStyle(lineWidth: lineWidth,
                                           lineCap: .round,
                                           lineJoin: .round)
                )
                .rotationEffect(.init(degrees: rotation))
            
            Text("\(Int(percent)) %")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //.font(.footnote)
                //.padding()
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percent: .constant(30))
    }
}
