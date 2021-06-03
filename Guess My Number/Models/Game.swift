//
//  Game.swift
//  Guess My Number
//
//  Created by bogdanov on 03.06.21.
//

import Foundation

struct Game {
    var target = Int.random(in: 1 ..< 100)

    var score: Int = 0
    var round: Int = 1

    func points(sliderValue: Int) -> Int {
        return 999
    }
}
