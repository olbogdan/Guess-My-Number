//
//  RoundedImageViewStroked.swift
//  GuessMyNumber
//
//  Created by bogdanov on 09.06.21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0, antialiased: true)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(Circle()
                            .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct PreviewPreviews: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct RoundedImageViewStroked_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPreviews()
        PreviewPreviews()
            .preferredColorScheme(.dark)
    }
}
