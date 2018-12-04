//
//  PlayerTests.swift
//  splendish
//
//  Created by Rachel Caileff on 12/3/18.
//  Copyright © 2018 Rachel Caileff. All rights reserved.
//

import XCTest
import splendish

class PlayerTests: XCTestCase {

    var player = Player("Sue")

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
        XCTAssertEqual(player.name, "Sue")
        XCTAssertEqual(player.gemCounts[Gem.diamond], 0)
        XCTAssertEqual(player.gemCounts[Gem.sapphire], 0)
        XCTAssertEqual(player.gemCounts[Gem.emerald], 0)
        XCTAssertEqual(player.gemCounts[Gem.ruby], 0)
        XCTAssertEqual(player.gemCounts[Gem.onyx], 0)
    }

    func testEmptyNameWorks() {
        let player2 = Player("")

        XCTAssertEqual(player2.name, "")
    }

    func testNameShouldAllowTwentyChars() {
        let player2 = Player("12345678901234567890")

        XCTAssertEqual(player2.name, "12345678901234567890")
    }

    func testNameShouldNotAllowMoreThanTwentyChars() {
        let player2 = Player("123456789012345678901")
        XCTAssertEqual(player2.name, "12345678901234567890")
    }

    func testNameShouldNotAllowSpecialCharacters() {
        let topRowSpecials = "`~!@#$%^&*())-_=+"
        let otherSpecials = "[{]}\\|;:'\",<.>/?"
        let player2 = Player("14x\(topRowSpecials)kcd")
        let player3 = Player("hi\(otherSpecials)ke")

        XCTAssertEqual(player2.name, "14xkcd")
        XCTAssertEqual(player3.name, "hike")
    }

    func testAddGems() {
        player.addGems([Gem.emerald, Gem.ruby])

        XCTAssertEqual(player.gemCounts[Gem.diamond], 0)
        XCTAssertEqual(player.gemCounts[Gem.sapphire], 0)
        XCTAssertEqual(player.gemCounts[Gem.emerald], 1)
        XCTAssertEqual(player.gemCounts[Gem.ruby], 1)
        XCTAssertEqual(player.gemCounts[Gem.onyx], 0)
    }

    func testGemsShouldNotExceedNine() {
        player.gemCounts[Gem.emerald] = 9

        player.addGems([Gem.emerald, Gem.ruby])

        XCTAssertEqual(player.gemCounts[Gem.ruby], 1)
        XCTAssertEqual(player.gemCounts[Gem.emerald], 9)
    }

    func testSubtractGems() {
        player.gemCounts[Gem.diamond] = 3
        player.gemCounts[Gem.sapphire] = 3
        player.gemCounts[Gem.onyx] = 3

        player.subtractGems([Gem.sapphire, Gem.diamond])

        XCTAssertEqual(player.gemCounts[Gem.diamond], 2)
        XCTAssertEqual(player.gemCounts[Gem.sapphire], 2)
        XCTAssertEqual(player.gemCounts[Gem.emerald], 0)
        XCTAssertEqual(player.gemCounts[Gem.ruby], 0)
        XCTAssertEqual(player.gemCounts[Gem.onyx], 3)
    }

    func testGemsShouldNotGoBelowZero() {
        player.subtractGems([Gem.onyx])

        XCTAssertEqual(player.gemCounts[Gem.onyx], 0)
    }
}
