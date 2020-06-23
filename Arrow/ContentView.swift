//
//  ContentView.swift
//  Arrow
//
//  Created by Gary Watson on 23/06/2020.
//  Copyright © 2020 Gary Watson. All rights reserved.
//

import SwiftUI

struct Rectangle: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: insetAmount, y:rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.maxY))
        
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX / 2, y:rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.minY))
        
        return path
    }
}
struct ContentView: View {
    @State private var insetAmount: CGFloat = 50
    var body: some View {
        VStack {
            Triangle()
                .frame(width: 200, height: 200)
            
            Rectangle(insetAmount: insetAmount)
                .frame(width: 200, height: 300)
                .onTapGesture {
                    withAnimation {
                        self.insetAmount = CGFloat.random(in: 10...90)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
