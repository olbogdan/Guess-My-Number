//
//  BackgroundView.swift
//  GuessMyNumber
//
//  Created by bogdanov on 10.06.21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(Color("BackgroundColor"))
        .ignoresSafeArea(.all)
    }
}

struct TopView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String

    var score: String

    var body: some View {
        VStack {
            LabelText(text: title)
            RoundedRectTextView(text: score)
                .padding(.top, 5)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            NumberView(title: "Score", score: String(game.score))
            Spacer()
            NumberView(title: "Round", score: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
