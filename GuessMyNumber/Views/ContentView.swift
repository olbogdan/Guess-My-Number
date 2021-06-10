//
//  ContentView.swift
//  Guess My Number
//
//  Created by bogdanov on 01.06.21.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderPosition: Double = 50
    @State private var alertIsVisible = false
    @State private var game = Game()

    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionText(text: "Point 🎯 as close as you can to")
                BigText(text: String(game.target))
                SliderView(sliderPosition: $sliderPosition)
                HitMeButton(alertIsVisible: $alertIsVisible)
                    .alert(isPresented: $alertIsVisible) {
                        resultAlert()
                    }
            }
            .padding()
            .foregroundColor(Color("TextColor"))
        }
    }

    private func resultAlert() -> Alert {
        let roundedValue = Int(sliderPosition.rounded())
        let points = game.points(sliderValue: roundedValue)
        return Alert(title: Text("Result"),
                     message: Text(
                         "The slider's value is \(roundedValue)\n"
                             + "You scored \(points) points this round."
                     ),
                     dismissButton: .default(Text("great!")) {
                         game.startNewRound(points: points)
                     })
    }
}

struct SliderView: View {
    @Binding var sliderPosition: Double
    var body: some View {
        HStack {
            SliderLabel(text: "1")
            Slider(value: $sliderPosition, in: 1 ... 100)
            SliderLabel(text: "100")
        }
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool

    var body: some View {
        Button(action: {
            alertIsVisible = true
        }) {
            Text("Hit me")
                .bold()
                .font(.title3)
                .textCase(.uppercase)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2)
        )
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(.white)
        .cornerRadius(16.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)

        ContentView()
            .preferredColorScheme(.light)

        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
