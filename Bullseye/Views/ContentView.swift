//
//  ContentView.swift
//  Bullseye
//
//  Created by user199344 on 6/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                        .bold()
                        .kerning(2.0)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.footnote)
                    Text("89")
                        .kerning(-1.0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    HStack {
                        Text("1")
                            .font(.body)
                            .bold()
                        Slider(value: self.$sliderValue, in:
                                1.0...100.0)
                        Text("100")
                            .font(.body)
                            .bold()
                    }.padding(10)
                    VStack {
                        Button(action: {
                            self.alertIsVisible = true
                        }) {
                            Text("HIT ME")
                        }
                        .alert(isPresented: $alertIsVisible,
                            content: {
                                let roundedValue: Int = Int(self.sliderValue.rounded())
                                return Alert(title: Text("Hi there!"), message: Text("The sliders values is \(roundedValue)."), dismissButton: .default(Text("Awesome")))
                        })
                        
                    }
                }
            }
        }
        	

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
