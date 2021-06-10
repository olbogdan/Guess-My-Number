//
//  PointsView.swift
//  GuessMyNumber
//
//  Created by bogdanov on 10.06.21.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigText(text: "50")
            BodyText(text: "You scored 200 points! \n 🥁🏆🎯")
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                ButtonText(text: "Start New Round")
            })
        }

        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView().previewLayout(.fixed(width: 400, height: 300))
        PointsView()
        PointsView()
            .preferredColorScheme(.dark)
    }
}
