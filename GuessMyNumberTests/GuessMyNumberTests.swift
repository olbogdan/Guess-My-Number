//
//  GuessMyNumberTests.swift
//  GuessMyNumberTests
//
//  Created by bogdanov on 06.06.21.
//

import XCTest

@testable import GuessMyNumber
import XCTest

class GuessMyNumberTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
        
        game.startNewRound(points: 50)
        XCTAssertEqual(game.score, 150)
        XCTAssertEqual(game.round, 3)
    }
}
