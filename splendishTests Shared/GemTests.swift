//
//  GemTests.swift
//  splendish
//
//  Created by Rachel Caileff on 12/3/18.
//  Copyright © 2018 Rachel Caileff. All rights reserved.
//

import XCTest
import splendish

class GemTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGemTypes() {
        XCTAssertNotNil(Gem.diamond)
        XCTAssertNotNil(Gem.sapphire)
        XCTAssertNotNil(Gem.emerald)
        XCTAssertNotNil(Gem.ruby)
        XCTAssertNotNil(Gem.onyx)

        XCTAssertNotNil(Gem.allCases)
    }
}
