//
//  LeaderboardView.swift
//  GuessMyNumber
//
//  Created by bogdanov on 12.06.21.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView()
                LabelView()
                RowView(index: 1, score: 132, data: Date())
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let data: Date

    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            DateText(date: data)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }.background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"),
                              lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack {
            BigBoldText(text: "Leaderboard")
            HStack {
                Spacer()
                Button(action: {}) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding()
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
        LeaderboardView()
            .previewLayout(.fixed(width: 450, height: 300))
            .preferredColorScheme(.dark)
    }
}
