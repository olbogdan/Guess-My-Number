//
//  Guess_My_NumberTests.swift
//  Guess My NumberTests
//
//  Created by bogdanov on 03.06.21.
//

@testable import Guess_My_Number
import XCTest

class Guess_My_NumberTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testAnyPointsReturns999() throws {
        XCTAssertEqual(game.points(sliderValue: 50), 999)
    }
}
