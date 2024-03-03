//
//  Shapes.swift
//  iOS_App
//
//  Created by CTS TechBar Checkout on 2/29/24.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    var body: some View {
        VStack{
            if !wideShapes{
                Circle()
                //  .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                
                    .strokeBorder(Color.blue, lineWidth: 20)
                    .frame(width: 200, height: 100)
                    .background(Color.green)
                    .transition(.scale)
            }
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(width: wideShapes ? 200 : 100, height: 100)
                  //  .animation(.easeInOut, value: wideShapes )
                Capsule()
                    .fill(Color.blue)
                    .frame(width: wideShapes ? 200 : 100, height: 100)
                Ellipse()
                    .fill(Color.blue)
                    .frame(width: wideShapes ? 200 : 100, height: 100)
            Button("Animate"){
                withAnimation{
                    wideShapes.toggle()
                }
            }
            }
    }
}

#Preview {
    Shapes()
}
