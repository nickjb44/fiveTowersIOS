//
//  Board.swift
//  fiveTowersGame
//
//  Created by Nick Buser on 4/7/23.
//

import Foundation

class Board {
    // Other properties and methods...

    private(set) var stonePool: [Stone] = []

    init() {
        initializeStonePool()
    }

    private func initializeStonePool() {
        // Common stones
        for _ in 0..<7 {
            stonePool.append(Stone(color: .green, type: .common))
            stonePool.append(Stone(color: .red, type: .common))
            stonePool.append(Stone(color: .blue, type: .common))
        }

        // Rare stones
        for _ in 0..<3 {
            stonePool.append(Stone(color: .white, type: .rare))
        }
        for _ in 0..<2 {
            stonePool.append(Stone(color: .yellow, type: .rare))
        }
        stonePool.append(Stone(color: .purple, type: .rare))

        // Shuffle the stone pool
        stonePool.shuffle()
    }

    // Other methods...
    private func drawStones(count: Int) {
        
        
    }
}
