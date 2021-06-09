//
//  TextViews.swift
//  GuessMyNumber
//
//  Created by bogdanov on 08.06.21.
//

import SwiftUI

struct InstructionText: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(2.0)
            .bold()
            .multilineTextAlignment(.center)
            .font(.footnote)
    }
}

struct BigText: View {
    var text: String

    var body: some View {
        Text(String(text))
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
    }
}

struct SliderLabel: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
            .font(.caption)
            .bold()
            .textCase(.uppercase)
    }
}

struct RoundedRectTextView: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.title)
            .frame(minWidth: 68, minHeight: 55)
            .foregroundColor(Color("TextColor"))
            .background(
                RoundedRectangle(cornerRadius: 21)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "title")
            BigText(text: "999")
            SliderLabel(text: "11")
            LabelText(text: "text")
            RoundedRectTextView(text: "999")
        }.previewLayout(.fixed(width: 200, height: 200))

        VStack {
            InstructionText(text: "title")
            BigText(text: "999")
            SliderLabel(text: "11")
            LabelText(text: "text")
            RoundedRectTextView(text: "999")
        }.previewLayout(.fixed(width: 200, height: 200))
            .preferredColorScheme(.dark)
    }
}
