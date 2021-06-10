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
        .background(RingsView())
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

struct RingsView: View {
    @Environment(\.colorScheme) var clorScheme

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(.all)
            ForEach(1 ..< 6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = clorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
                    )

                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
