//
//  PointsView.swift
//  Bullseye
//
//  Created by user199344 on 6/22/21.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
      let roundedValue = Int(sliderValue.rounded())
      let points = game.points(sliderValue: roundedValue)

      VStack(spacing: 10) {
        InstructionText(text: "The slider's value is")
        BigNumberText(text: String(roundedValue))
        BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
        Button(action: {
            withAnimation{
                alertIsVisible = false
                
            }
          game.newRound(points: points)
        }) {
          ButtonText(text: "Start New Round")
        }
      }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
      .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
  }

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(alertIsVisible: .constant(true), sliderValue: .constant(50), game: .constant(Game())).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        PointsView(alertIsVisible: .constant(true), sliderValue: .constant(50), game: .constant(Game()))
    }
}
