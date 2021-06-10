//
//  Game.swift
//  Guess My Number
//
//  Created by bogdanov on 03.06.21.
//

import Foundation

private let maxValue = 100
private var randomTarget: Int {
    Int.random(in: 1 ..< maxValue)
}

struct Game {
    var target = randomTarget

    var score = 0
    var round = 1

    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = randomTarget
    }

    mutating func restart() {
        score = 0
        round = 1
        target = randomTarget
    }

    func points(sliderValue: Int) -> Int {
        maxValue - rowPointsDiff(sliderValue) + getBonusPoints(sliderValue)
    }

    private func getBonusPoints(_ sliderValue: Int) -> Int {
        let diff = rowPointsDiff(sliderValue)
        switch diff {
            case 0:
                return 100
            case 1 ... 2:
                return 50
            default:
                return 0
        }
    }

    private func rowPointsDiff(_ sliderValue: Int) -> Int {
        abs(target - sliderValue)
    }
}
