//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by user199344 on 6/22/21.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        VStack (spacing: 10){
            HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
            LabelView()
            ScrollView {
                VStack(spacing: 10){
                    ForEach(game.leaderboardEntries.indices){ i in
                        let leaderboardEntry = game.leaderboardEntries[i]
                        
                        RowView(index: i + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                    }
                }
            }
            
        }
    }
}

struct RowView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
        }.background(RoundedRectangle(cornerRadius: .infinity).stroke(Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth))
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
        
    }
}

struct HeaderView: View{
    
    @Binding var leaderBoardIsShowing: Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View{
        ZStack {
            HStack {
                
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                }else{
                    BigBoldText(text: "Leaderboard")
                }
            }.padding(.top)
            HStack{
                Spacer()
                Button(action: {leaderBoardIsShowing = false}) {
                    RoundedImageViewsFilled(systemName: "xmark").padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View{
    var body: some View{
        HStack{
            Spacer().frame(width: Constants.General.roundedViewLength)
            Spacer()
            BottomText(text: "Score")
                .frame(width:Constants.LeaderBoard.leaderboardScoreColWidth)
            Spacer()
            BottomText(text: "Date")
                .frame(width: Constants.LeaderBoard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(leaderBoardIsShowing: .constant(true), game: .constant(Game(loadTestData: true))).preferredColorScheme(.dark)
    }
}
