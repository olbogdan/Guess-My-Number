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
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Point 🎯 as close as you can to")
                        .kerning(2.0)
                        .bold()
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.footnote)
                    Text(String(game.target))
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .lineSpacing(-1.0)
                }
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $sliderPosition, in: 1 ... 100)
                    Text("100")
                        .bold()
                }
                Button(action: {
                    alertIsVisible = true
                }) {
                    Text("Hit me")
                        .bold()
                        .font(.title3)
                        .textCase(.uppercase)
                }
                .padding()
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(.white)
                .cornerRadius(16.0)
                .alert(isPresented: $alertIsVisible) {
                    let roundedValue = Int(sliderPosition.rounded())
                    return Alert(title: Text("Result"),
                                 message: Text(
                                     "The slider's value is \(roundedValue)\n"
                                         + "You scored \(game.points(sliderValue: roundedValue)) points this round."
                                 ),
                                 dismissButton: .default(Text("great!")))
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
