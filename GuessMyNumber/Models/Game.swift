//
//  Game.swift
//  Guess My Number
//
//  Created by bogdanov on 03.06.21.
//

import Foundation

private let maxValue = 100

struct Game {
    var target = Int.random(in: 1 ..< maxValue)

    var score = 0
    var round = 1

    func points(sliderValue: Int) -> Int {
        maxValue - abs(target - sliderValue)
    }

    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1 ..< maxValue)
    }
}
