//
//  ContentView.swift
//  Bullseye
//
//  Created by user199344 on 6/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack{
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : CGFloat(100))
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else{
                    ButtonView(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                }
                
            }
            if !alertIsVisible{
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View{
    @Binding var game: Game
    var body: some View{
        VStack{
            InstructionText(text: "🎯🎯🎯\nput the bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View{
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            LimitText(text: "1")
            Slider(value: $sliderValue, in:
                    1.0...100.0)
            LimitText(text: "100")
            }
            .padding()
    }
}

struct ButtonView: View{
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    var body: some View{
        Button(action: {
            withAnimation{
                alertIsVisible = true
            }
            
        }) {
            Text("hit me".uppercased())
                .bold()
                .font(.title3)
        }
            .padding(20.0)
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .cornerRadius(Constants.General.roundedRectCornerRadius)
            .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .stroke(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.device)
            .previewDevice("iPhone 12")
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(PreviewLayout.fixed(width:568,height:320))
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPhone 12")
        ContentView().previewLayout(PreviewLayout.fixed(width:568,height:320))
        
    }
}
