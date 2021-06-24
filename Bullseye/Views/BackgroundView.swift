//
//  BackgroundView.swift
//  Bullseye
//
//  Created by user199344 on 6/21/21.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingView())
    }
}

struct TopView: View {
    
    @Binding var game: Game
    @State private var leaderBoardIsShowing = false
    
    var body: some View {
        HStack{
            
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewsStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderBoardIsShowing = true
            }) {
                RoundedImageViewsFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderBoardIsShowing, onDismiss: {}, content: {
                LeaderboardView(leaderBoardIsShowing: $leaderBoardIsShowing, game: $game)
            })
            
        }
    }
}

struct RoundRectNumberView: View{
    var title: String
    var number: String
    
    var body: some View{
        VStack(spacing: 25, content: {
            BottomText(text: title)
            BottomNumber(text:  number).background(RoundedRectangle(cornerRadius: 10).stroke(Color("StrokeNumberColor"), lineWidth: Constants.General.strokeWidth).frame(width: 70, height: 55))
        })
    }
}

struct NumberView: View{
    var title: String
    var text: String
    
    var body: some View{
        RoundRectNumberView(title: title, number: text).padding()
    }
}

struct BottomView: View {
    
    @Binding var game: Game
    
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        ZStack{
            Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke((RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)), lineWidth: 20.0)
                    .frame(width: size, height: size)
            }
            
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}


