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
            Color("BackgroundColor")
            VStack {
                Text("🎯🎯🎯\nput the bullseye as close as you can to".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
                HStack {
                    Text("1")
                        .font(.body)
                        .bold()
                    Slider(value: $sliderValue, in:
                            1.0...100.0)
                    Text("100")
                        .font(.body)
                        .bold()
                    }
                    .padding()
                Button(action: {
                    alertIsVisible = true
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
                    .cornerRadius(21.0)
                    .foregroundColor(.white)
                .alert(isPresented: $alertIsVisible,
                        content: {
                let roundedValue: Int = Int(sliderValue.rounded())
                            
                return Alert(title: Text("Hi there!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome")))
            })
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .previewDevice("iPhone 12")
        ContentView().previewLayout(PreviewLayout.fixed(width:568,height:320))
        
    }
}
