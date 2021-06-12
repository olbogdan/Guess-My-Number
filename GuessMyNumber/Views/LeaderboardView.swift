//
//  LeaderboardView.swift
//  GuessMyNumber
//
//  Created by bogdanov on 12.06.21.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        RowView(index: 1, score: 132, data: Date())
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

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
        LeaderboardView()
            .previewLayout(.fixed(width: 450, height: 100))
            .preferredColorScheme(.dark)
    }
}
