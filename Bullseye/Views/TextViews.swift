//
//  TextViews.swift
//  Bullseye
//
//  Created by user199344 on 6/21/21.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct LimitText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundColor(Color("TextColor")).frame(width:35.0)
    }
}

struct BottomText: View{
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .kerning(1.5)
            .font(.caption)
            .bold()
    }
}

struct BottomNumber: View{
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .kerning(-0.2)
            .bold()
            .font(.title3)
    }
}

struct BodyText: View{
    var text: String
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
            .lineSpacing(16)
    }
}

struct ButtonText: View{
    var text: String
    var body: some View{
        Text(text)
            .font(.headline)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
            
    }
}

struct ScoreText: View{
    var score: Int
    var body: some View{
        Text(String(score))
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText: View{
    var date: Date
    var body: some View {
        Text(date, style: .date)
            .kerning(-0.2)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText: View {
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .fontWeight(.black)
            .font(.title)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {

    static var previews: some View {
        VStack{
            InstructionText(text: "Example")
            BigNumberText(text: "85")
            LimitText(text: "100")
            BottomText(text: "Score")
            BottomNumber(text: "999")
            BodyText(text: "You scored 200 points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 258)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }.padding()
    }
}
