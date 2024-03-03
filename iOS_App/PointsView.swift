//
//  PointsView.swift
//  iOS_App
//
//  Created by CTS TechBar Checkout on 3/2/24.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game : Game
    
    var body: some View {
        let roundedvalue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedvalue)
        VStack(spacing: 10){
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedvalue))
            BodyText(text: "You scored \(points) Points\n 😻😻😻 ")
            Button {
                withAnimation{alertIsVisible = false}
              
                game.startNewRound(points: points)
            } label: {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10, x: 5, y:5)
    }
}

struct PointsViww_Previews: PreviewProvider{
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View{
        
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }}
