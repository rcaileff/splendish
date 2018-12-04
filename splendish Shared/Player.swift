//
//  Player.swift
//  splendish
//
//  Created by Rachel Caileff on 12/3/18.
//  Copyright © 2018 Rachel Caileff. All rights reserved.
//

import Foundation

public class Player: NSObject {
    public var name: String = "player 1"
    public var gemCounts: [Gem: Int] = [:]

    public init(_ name: String) {
        super.init()

        self.name = legalizeName(name)
        for gem in Gem.allCases {
            gemCounts[gem] = 0
        }
    }

    public func addGems(_ gems: [Gem]) {
        for gem in gems {
            if let count = gemCounts[gem] {
                if count < 9 {
                    gemCounts[gem] = count + 1
                }
            }
        }
    }

    public func subtractGems(_ gems: [Gem]) {
        for gem in gems {
            if let count = gemCounts[gem] {
                if count > 0 {
                    gemCounts[gem] = count - 1
                }
            }
        }
    }

    private func legalizeName(_ name: String) -> String {
        let okChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        let stripped =  name.filter {okChars.contains($0) }
        if stripped.count > 20 {
            return String(stripped[..<stripped.index(stripped.startIndex, offsetBy: 20)])
        } else {
            return stripped
        }
    }
}
