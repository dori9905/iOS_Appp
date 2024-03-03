//
//  LeaderBoardView.swift
//  iOS_App
//
//  Created by CTS TechBar Checkout on 3/2/24.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                VStack(spacing: 10){
                    ForEach(game.leaderboardEntries.indices, id: \.self){
                        index in
                        let leaderboardEntry = game.leaderboardEntries[index]
                        RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                    }
                    }
                }
            }
        }
    }
}

struct HeaderView: View{
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderBoardIsShowing: Bool
    var body: some View{
        ZStack{
            HStack{
                BigBoldText(text: "LeaderBoard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    Spacer()
                }
            }
            
            HStack{
                Spacer()
                Button{
                    leaderBoardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
             
            }
        }
        .padding([.horizontal, .top])
    }
}

struct LabelView: View{
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.LeaderBoard.maxrowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View{
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth))
        .padding(.horizontal)
        .frame(maxWidth: Constants.LeaderBoard.maxrowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider{
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View{
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewInterfaceOrientation(.landscapeRight)
        
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
    }
}
