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
            .lineSpacing(4.0)
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


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "title")
            BigText(text: "999")
            SliderLabel(text: "11")
        }
    }
}
