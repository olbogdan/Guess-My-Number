//
//  ContentView.swift
//  Guess My Number
//
//  Created by bogdanov on 01.06.21.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderPosition: Double = 50
    var body: some View {
        VStack {
            VStack {
                Text("Point 🎯 as close as you can to")
                    .padding()
                Text("89")
            }
            HStack {
                Text("1")
                Slider(value: $sliderPosition, in: 1 ... 100)
                Text("100")
            }
            Button(action: {}) {
                Text("Hit me")
            }
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
