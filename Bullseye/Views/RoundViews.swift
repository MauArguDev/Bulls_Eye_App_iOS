//
//  RoundViews.swift
//  Bullseye
//
//  Created by user199344 on 6/21/21.
//

import SwiftUI

struct RoundedImageViewsStroked: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor")).frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(Circle().stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedImageViewsFilled: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(Circle().fill(Color("ButtonFilledBackgroundColor")))
    }
}



struct RoundedTextView: View {
    let text: String
    
    var body: some View{
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength).overlay(Circle().stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    }
}


struct PreviewsView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
            RoundedImageViewsStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewsFilled(systemName: "list.dash")
            RoundedTextView(text: "1")
        })
    }
}
struct RoundViews_Previews: PreviewProvider{
    static var previews: some View{
        PreviewsView()
        PreviewsView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
